// Cargo el valor de fila
LSK #K      3C      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = K
MOV Ri,W    1A      // Mover Wr a R26

// Cargo el valor de columna
LSK #K      50      // K_lsb = 00 
MOK W,#K    00      // K_msb = 00; Wr = K
MOV Ri,W    1B      // Mover Wr a R27

PIX RGB     05      //Pinto de color amarillo

LSK #K      9C      //
MOK W,#K    FF      // Wr = -100

ADR W,Rj    1B      // W = R27 - 100

JZE X       A       // Me quedo acá    

LSK #K      01
MOK W,#K    00      // Wr = 1

ADW Ri,Rj   1B  1B

JMP X       6

