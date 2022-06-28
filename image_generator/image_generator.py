from PIL import Image
import numpy as np

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

# Generate image
im = Image.open('test.png')

pixels = list(im.getdata())
print(len(pixels))
image = []
for r, g, b in pixels:
    rb = '1' if r > 256/2 else '0'
    bb = '1' if g > 256/2 else '0'
    gb = '1' if b > 256/2 else '0'
    image.append(str_bin2hex(rb+bb+gb, 2))

print(len(image))

# Save .hex file
dest_file = open('vga_memory.hex', 'w+')
for i, code in enumerate(image):
    hex_str = '01' + hex(i)[2:].zfill(4)[-4:].upper() + '00' + code
    hex_str = ':' + hex_str + calc_checksum(hex_str) + '\n'
    dest_file.write(hex_str.upper())
dest_file.write(':00000001FF\n')

dest_file.close()