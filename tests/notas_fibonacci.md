| Binary              | Description         |
| ------------------- | ------------------- |
| 0000 0000 0000 0000 | Nada                |
| 0000 0000 0000 0000 | Nada                |
| 0000 0100 0000 0001 | K_lsb = 1           |
| 0100 0100 0000 0000 | K_msb = 0; Wr = K   |
| 0000 1100 0000 0000 | Mover Wr a R0       |
| 0000 0100 0000 0001 | K_lsb = 1           |
| 0100 0100 0000 0000 | K_msb = 0; Wr = K   |
| 0001 1000 0010 0000 | R1 = Wr+R0          |
| 0000 0010 0000 0000 | Wr = R0             |
| 0001 1000 0000 0001 | R0 = Wr+R1          |
| 0000 0010 0000 0000 | Wr = R1             |
| 0001 1000 0010 0000 | R1 = Wr+R0          |
| 0000 0010 0000 0001 | Wr = R0             |
| 0001 1000 0000 0001 | R0 = Wr+R1          |
| 0000 0010 0000 0000 | Wr = R1             |
| 0001 1000 0010 0000 | R1 = Wr+R0          |
| 0000 0010 0000 0001 | Wr = R0             |
| 0001 1000 0000 0001 | R0 = Wr+R1          |
| 0000 0010 0000 0000 | Wr = R1             |
| 0001 1000 0010 0000 | R1 = Wr+R0          |
| 0000 0010 0000 0001 | Wr = R0             |
| 0001 1000 0000 0001 | R0 = Wr+R1          |
| 0000 0010 0000 0000 | Wr = R1             |
| 0001 1000 0010 0000 | R1 = Wr+R0          |