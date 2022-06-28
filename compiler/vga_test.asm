
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
PIX W               //Pinto de color W

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   1B 1B   // R27 = Wr+R27
ADW Ri,Rj   01 01   // R1 = Wr+R1
MOV W,Rj    01      // Wr = R1

JZE X       18      //Me salteo el JMP X
JMP X       F       //Vuelvo a ejecutar PIX RGB

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   1A 1A   // R26 = Wr+R26
ADW Ri,Rj   00 00   // R0 = Wr+R0
MOV W,Rj    00      // Wr = R0

JZE X       1F      //Terminó la imagen
JMP X       9       //Reinicio las columnas

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K
ADW Ri,Rj   2 2     // R2 = Wr+R2

JMP X       3


