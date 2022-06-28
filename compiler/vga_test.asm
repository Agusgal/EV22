// Cargo el contador de colores
LSK #K      00      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = 00
MOV Ri,W    02      // Mover Wr a R2

// Cargo el contador de filas
LSK #K      88      // K_lsb = 88 
MOK W,#K    FF      // K_msb = FF; Wr = -120
MOV Ri,W    0       // Mover Wr a R0

// Cargo el valor de fila
LSK #K      00      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = K
MOV Ri,W    1A      // Mover Wr a R26

// Cargo el contador de columnas
LSK #K      60      // K_lsb = 60 
MOK W,#K    FF      // K_msb = FF; Wr = -160
MOV Ri,W    1       // Mover Wr a R1

// Cargo el valor de columna
LSK #K      00      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = K
MOV Ri,W    1B      // Mover Wr a R27

MOV W,Rj    02      // Wr = R2
PIX W               // Pinto de color W
BSR S       24      // Delay

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   1B 1B   // R27 = Wr+R27
ADW Ri,Rj   01 01   // R1 = Wr+R1
MOV W,Rj    01      // Wr = R1

JZE X       19      //Me salteo el JMP X
JMP X       F       //Vuelvo a ejecutar PIX

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   1A 1A   // R26 = Wr+R26
ADW Ri,Rj   00 00   // R0 = Wr+R0
MOV W,Rj    00      // Wr = R0

JZE X       20      //Terminó la imagen, me salteo el jmp
JMP X       9       //Reinicio las columnas

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   2 2     // R2 = Wr+R2

//BSR S       24
JMP X       3

// Delay
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
RET


//////////////////////////////////////
LSK #K      00      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = 0
MOV Ri,W    03      // Mover Wr a R3
LSK #K      01      // K_lsb = 01 
MOK W,#K    00      // K_msb = 00; Wr = 1
ADR W,Rj    03      // W=W+R3
MOV Ri,W    03      // R3 = W
JZE X       35      // RET

LSK #K      F0      // K_lsb = 9C 
MOK W,#K    FF      // K_msb = FF; Wr = -100
MOV Ri,W    04      // Mover Wr a R4
LSK #K      01      // K_lsb = 01 
MOK W,#K    00      // K_msb = 00; Wr = 1
ADR W,Rj    04      // W=W+R4
MOV Ri,W    04      // R4 = W
JZE X       27      //volver al segundo lsk

JMP X       2F      //volver al cuarto lsk
RET


