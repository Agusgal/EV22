LSK #K      1       // K_lsb = 1 
MOK W,#K    0       // K_msb = 0; Wr = K
MOV Ri,W    0       // Mover Wr a R0

LSK #K      1       // K_lsb = 1
MOK W,#K    0       // K_msb = 0; Wr = K

ADW Ri,Rj   1 0     // R1 = Wr+R0
MOV W,Rj    0       // Wr = R0
ADW Ri,Rj   0 1     // R0 = Wr+R1
MOV W,Rj    1       // Wr = R1

ADW Ri,Rj   1 0     // R1 = Wr+R0
MOV W,Rj    0       // Wr = R0
ADW Ri,Rj   0 1     // R0 = Wr+R1
MOV W,Rj    1       // Wr = R1

ADW Ri,Rj   1 0     // R1 = Wr+R0
MOV W,Rj    0       // Wr = R0
ADW Ri,Rj   0 1     // R0 = Wr+R1
MOV W,Rj    1       // Wr = R1

ADW Ri,Rj   1 0     // R1 = Wr+R0
MOV W,Rj    0       // Wr = R0
ADW Ri,Rj   0 1     // R0 = Wr+R1
MOV W,Rj    1       // Wr = R1
