LSK #K      B0      // Cargo el indice X            // K_lsb = B0
MOK W,#K    FF                                      // K_msb = FF; Wr = -80
MOV Ri,W    03                                      // Mover Wr a R3
LSK #K      C4      // Cargo el indice Y            // K_lsb = C4
MOK W,#K    FF                                      // K_msb = FF; Wr = -60
MOV Ri,W    04                                      // Mover Wr a R4
LSK #K      00      // Cargo el contador de colores // K_lsb = 00 
MOK W,#K    00                                      // K_msb = 00; Wr = 00
MOV Ri,W    02                                      // Mover Wr a R2
LSK #K      00      // Cargo el contador de colores // K_lsb = 00 
MOK W,#K    00                                      // K_msb = 00; Wr = 00
MOV Ri,W    02                                      // Mover Wr a R2
LSK #K      88      // Cargo el contador de filas   // K_lsb = 88 
MOK W,#K    FF                                      // K_msb = FF; Wr = -120
MOV Ri,W    0                                       // Mover Wr a R0
LSK #K      00      // Cargo el valor de fila       // K_lsb = 00 
MOK W,#K    00                                      // K_msb = 00; Wr = K
MOV Ri,W    1A                                      // Mover Wr a R26
LSK #K      60      // Cargo el contador de cols    // K_lsb = 60 
MOK W,#K    FF                                      // K_msb = FF; Wr = -160
MOV Ri,W    1                                       // Mover Wr a R1
LSK #K      00      // Cargo el valor de columna    // K_lsb = 00 
MOK W,#K    00                                      // K_msb = 00; Wr = K
MOV Ri,W    1B                                      // Mover Wr a R27
MOV W,Rj    03      // Traigo el indice X           // Wr = R3
ADR W,Rj    1B                                      // W = W + R27
JNE X       29      // Comparo R27 con el indice X  // No pintar (jmp 41)
LSK #K      F0      // Cargo el -ancho X            // K_lsb = F0
MOK W,#K    FF                                      // K_msb = FF; Wr = -16px
ADR W,Rj    03                                      // W = W + R3
ADR W,Rj    1B                                      // W = W + R27
JNE X       21      // Comparo R27 con X+width      // Pintar (Check Y)
JMP X       29      // Pinto color de fondo         // No pintar (jmp 41)
MOV W,Rj    04      // Traigo el indice Y           // Wr = R4
ADR W,Rj    1A                                      // W = W + R26
JNE X       29      // Comparo R26 con el indice Y  // No pintar (jmp 41)
LSK #K      F0      // Cargo el -alto Y             // K_lsb = F0
MOK W,#K    FF                                      // K_msb = FF; Wr = -16px
ADR W,Rj    04                                      // W = W + R4
ADR W,Rj    1A                                      // W = W + R26
JNE X       2B      // Comparo R26 con Y+height     // Pintar (jmp 43)
PIX RGB     01      // Pinto de color Azul (fondo)
JMP X       2C      // Continuo ++2
PIX RGB     04      //  Pinto de color Rojo (Puntito)
LSK #K      1                                       // K_lsb = 1
MOK W,#K    0                                       // K_msb = 0; Wr = K
ADW Ri,Rj   1B 1B                                   // R27 = Wr+R27
ADW Ri,Rj   01 01                                   // R1 = Wr+R1
MOV W,Rj    01                                      // Wr = R1
JZE X       33      //Me salteo el JMP X
JMP X       18      //Vuelvo a ejecutar PIX RGB
LSK #K      1                                       // K_lsb = 1
MOK W,#K    0                                       // K_msb = 0; Wr = K
ADW Ri,Rj   1A 1A                                   // R26 = Wr+R26
ADW Ri,Rj   00 00                                   // R0 = Wr+R0
MOV W,Rj    00                                      // Wr = R0
JZE X       C      //Terminó la imagen
JMP X       12     //Reinicio las columnas


