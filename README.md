# CUDA_Final_ZSC

## GPU Programming - Assignment 1

 

Write a CUDA C/C++ program that uses a 10×10 matrix, M, and a 10-element vector, V. Your program must implement a CUDA kernel that modifies the matrix M in place.

 

The modification rule is as follows: each element Mij​ (element in row i, column j) should be updated by multiplying it with the corresponding element Vj​ from the vector.

 

Mathematically: Mij​←Mij​×Vj​ for all 0≤i<10 and 0≤j<10.

 

Important Clarification: This is not standard matrix-vector multiplication (which computes a dot product). Each element in a specific column j of the matrix is multiplied by the same vector element Vj​.

 

Implementation Guidelines:

Initialize the matrix M and vector V on the host (CPU) as follows [2]:
Fill the vector V such that Vj​=j+1 for 0≤j<10. (i.e., V=[1,2,3,...,10]).
Fill the matrix M such that every row contains the integers from 1 to 10. That is, Mij​=j+1 for all 0≤i<10 and 0≤j<10. (Each row is identical to the initial vector V).
Print out the contents of the vector and matrix. Design and launch a CUDA kernel to perform the element-wise multiplication as described above. Carefully determine your grid and block dimensions (<<<gridDim, blockDim>>>) to cover all 100 matrix elements. Include verification on the host to confirm the calculation is correct. (Hint: Given the inputs, what should the value of Mij​ be after the kernel runs?) Print out the contents of the vector and matrix.
Deliverables:

Your fully commented CUDA C/C++ source code (.cu file).
A short README file explaining:
How you chose your grid and block dimensions.
How threads are mapped to matrix elements within your kernel.
How to compile and run your code.
The expected result in the matrix after the operation.
Grading: Correctness of the computation (60%), efficient use of threads/blocks (20%), code clarity and comments (10%), README explanation (10%).

 

## GPU Programming - Assignment 2

Title: CUDA Matrix-Vector Multiplication via Parallel Dot Product Calculation

Background:

The dot product (or scalar product) of two vectors, A=[a1​,a2​,...,an​] and B=[b1​,b2​,...,bn​], is defined as the sum of the products of their corresponding elements: A⋅B=∑i=1n​ai​bi​. The result is a single scalar value.

 

Task:

 

Using the same initial 10×10 matrix M and 10-element vector V from Assignment 1 (where Mij​=j+1 and Vj​=j+1), write a CUDA C/C++ program to compute the standard matrix-vector product R=M×V.

 

This results in a 10-element vector R, where each element Ri​ is the dot product of the i-th row of matrix M (Mi∗​) and the vector V.

 

Mathematically: Compute Ri​=∑j=09​Mij​×Vj​ for all 0≤i<10.

 

Implementation Guidelines:

Initialize the matrix M and vector V on the host as specified (Mij​=j+1,Vj​=j+1).
Allocate memory on the GPU device for M, V, and the result vector R.
Print M and V.
Design and launch a CUDA kernel to compute the result vector R. A common strategy is:
Assign one thread block to compute one element Ri​.
Within each block, threads compute partial products (Mij​×Vj​).
Implement an efficient parallel reduction (summation) within the block, possibly using shared memory, to sum the partial products and obtain the final value for Ri​.
Verify the result on the host. (Hint: What should every element of R be, given the inputs?) Print R. Free allocated GPU memory.
Deliverables:

Your fully commented CUDA C/C++ source code (.cu file).
A short README file explaining:
Your kernel launch configuration (grid/block dimensions).
How thread blocks compute individual dot products.
The expected result in vector R and why.
How to compile and run your code.
Grading: Correctness of the computation (50%), efficiency and correctness of the parallel reduction (30%), code clarity and comments (10%), README explanation (10%).
