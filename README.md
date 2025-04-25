# CUDA Matrix and Vector Operations

## Program 1: Assignment 1

1. When choosing my grid and block dimensions I opted to use 10 blocks and 10 threads in each block since the matrix has 10 rows and 10 elements in each row, this structure allows for a very parallel solution.

2. One block corresponds to a matrix row and the threads in the block correspond to an element in that row.

3. To compile and run the code I used leetGPU website which allows me to run on hardware with a GPU, since my system does not have one.

4. I expected each element in the resultant matrix to be the square of the original element. So 10 become 100, 9 becomes 81 and so on down to 1 becoming 1.

## Program 2: Matrix-Vector Multiplication

## Program 1: Assignment 1

1. When choosing my grid and block dimensions I opted to use 10 blocks and 10 threads in each block since the matrix has 10 rows and 10 elements in each row, this structure allows for a very parallel solution.

2. One block corresponds to a matrix row and the threads in the block correspond to an element in that row. Each Thread adds to the resultant vector according to the row it is in.

3. To compile and run the code I used leetGPU website which allows me to run on hardware with a GPU, since my system does not have one.

4. I expected the resultant vector to be all 385 for every element as is true with the multiplication of the two intiial variables.
