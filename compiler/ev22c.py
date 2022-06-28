'''
EV22 Assembly interpreter
- Usage: python ev22c.py "source_file.asm" "destination_file.hex"

Input file should be a text file with one opcode per line and its parameters in order
Error checking is still very simple and doesn't indicate the type of error, only its location
The output file has an intel hex file format and should have the extension '.hex'

Author: M. Bergerman
'''


import sys
from os import path

def str_hex2bin(hex_data, n):
    return bin(int(str(hex_data), 16))[2:].zfill(n)[-n:]

def str_bin2hex(bin_data, n):
    return hex(int(str(bin_data), 2))[2:].zfill(n)[-n:].upper()

def calc_checksum(hex_data):
    byte_data = [hex_data[i:i+2] for i in range(0, len(hex_data), 2)]
    checksum = sum(list(map(lambda x: int(x, 16), byte_data)))
    checksum &= int('00ff', 16)
    checksum ^= int('00ff', 16)
    checksum += 1
    return hex(checksum)[2:].zfill(2)[-2:].upper()

def getBinOpcode(opcode):
    # May thow an exception if argument count is wrong

    if opcode[0] in ['RET', 'NOP']:      # Special cases
        keyword = opcode[0]
    else:
        keyword = opcode[0] + ' ' + opcode[1]

    if keyword == 'JMP X':
        return '00100' + str_hex2bin(opcode[2], 11)
    elif keyword == 'JZE X':
        return '00101' + str_hex2bin(opcode[2], 11)
    elif keyword == 'JNE X':
        return '00110' + str_hex2bin(opcode[2], 11)
    elif keyword == 'JCY X':
        return '00111' + str_hex2bin(opcode[2], 11)
    elif keyword == 'MOM Y,W':
        return '000100' + str_hex2bin(opcode[2], 10)
    elif keyword == 'MOM W,Y':
        return '000101' + str_hex2bin(opcode[2], 10)
    elif keyword == 'ADW Ri,Rj':
        return '000110' + str_hex2bin(opcode[2], 5) + str_hex2bin(opcode[3], 5)
    elif keyword == 'BSR S':
        return '000111' + str_hex2bin(opcode[2], 10)
    elif keyword in ['MOV Ri,Rj', 'MOV POi,Rj', 'MOV Ri,PIj', 'MOV POi,PIj']:
        return '000010' + str_hex2bin(opcode[2], 5) + str_hex2bin(opcode[3], 5)
    elif keyword in ['MOV Ri,W', 'MOV POi,W']:
        return '000011' + str_hex2bin(opcode[2], 5) + '00000'
    elif keyword == 'LSK #K':
        return '00000100' + str_hex2bin(opcode[2], 8)
    elif keyword == 'MOK W,#K':
        return '10000100' + str_hex2bin(opcode[2], 8)
    elif keyword == 'ANK W,#K':
        return '10000101' + str_hex2bin(opcode[2], 8)
    elif keyword == 'ORK W,#K':
        return '10000110' + str_hex2bin(opcode[2], 8)
    elif keyword == 'ADK W,#K':
        return '10000111' + str_hex2bin(opcode[2], 8)
    elif keyword in ['MOV W,Rj', 'MOV W,PIj']:
        return '00000010000' + str_hex2bin(opcode[2], 5)
    elif keyword == 'ANR W,Rj':
        return '01000010000' + str_hex2bin(opcode[2], 5)
    elif keyword == 'ORR W,Rj':
        return '00000011000' + str_hex2bin(opcode[2], 5)
    elif keyword == 'ADR W,Rj':
        return '01000011000' + str_hex2bin(opcode[2], 5)
    elif keyword == 'CPL W':
        return '0100010000000000'
    elif keyword == 'CLR CY':
        return '0100000000000000'
    elif keyword == 'SET CY':
        return '0000000100000000'
    elif keyword == 'RET':
        return '0100000100000000'
    elif keyword == 'NOP':
        return '0000000000000000'
    elif keyword == 'PIX RGB':
        return '0110000000000' + str_hex2bin(opcode[2], 3)
    elif keyword == 'PIX W':
        return '0111000000000000'
    else:
        raise ValueError('Invalid Opcode') 

if len(sys.argv) != 3:
    print('Wrong number of arguments passed')
    print('Usage: python ev22c.py "source_file.asm" "destination_file.hex"')
    exit()

source_path = sys.argv[1]
destination_path = sys.argv[2]

if not path.exists(source_path):
    print(f'File "{source_path}" does not exist.')
    exit()

MEM_SIZE = 256
memory = ['0000' for _ in range(MEM_SIZE)]
memory_index = 0

with open(source_path, 'r+') as source:
    error_list = []
    file_rows = source.readlines()
    for line_index, line in enumerate(file_rows):
        opcode = line.rstrip('\r\n').split(' ')
        opcode = list(filter(None, opcode))             # Remove empty strings
        if len(opcode) == 0:
            continue                                    # Ignore empty lines
        if opcode[0].startswith('//'):                  # Ignore commented lines
            continue

        try:
            memory[memory_index] = str_bin2hex( getBinOpcode(opcode), 4 )
            memory_index += 1
        except IndexError:
            error_list.append(line_index)
        except ValueError:
            error_list.append(line_index)
    
    if len(error_list) == 0:
        print('Compilation errors: 0')
        print('Generating hex file...')
        
        # Save .hex file
        dest_file = open(destination_path, 'w+')
        for i, code in enumerate(memory):
            hex_str = '02' + hex(i)[2:].zfill(4)[-4:].upper() + '00' + code
            hex_str = ':' + hex_str + calc_checksum(hex_str) + '\n'
            dest_file.write(hex_str.upper())
        dest_file.write(':00000001FF\n')

        print('Done')
    else:
        print('Compilation errors: ' + str(len(error_list)))
        for index in error_list:
            line = file_rows[index].rstrip("\r\n")
            print(f'Error at line {index+1}:    {line}')
        print('Closing...')
