#include <stdio.h>
#include <cuda_runtime.h>

#define SIZE 10

// CUDA kernel
__global__ void calcR(int* M,int* V, int* R) {
    int i = blockIdx.x;
    int j = threadIdx.x;

    R[i] += M[i * SIZE + j] * V[j];
}

int main(void) {
    int* M;
    int* V;
    int* R;

    // Allocate memory + Syncrohnize between CPU and GPU
    cudaMalloc(&M, SIZE * SIZE * sizeof(int));
    cudaMalloc(&V, SIZE * sizeof(int));
    cudaMalloc(&R, SIZE * sizeof(int));


    // Fill the matrix where a given element is the column index + 1
    for( int j = 0; j < SIZE; j++ ) {
        for( int i = 0; i < SIZE; i++ ) {
            M[j * SIZE + i] = i + 1;
        }
    }
    
    // Fill the vector, V, where a given element is the index + 1
    // Initialize the resultant vector, R, to 0's for all elements
    for( int j = 0; j < SIZE; j++ ) {
        V[j] = j + 1;
        R[j] = 0;
    }

    // Print the matrix and vector
    printf("Matrix M:\n");
    for( int j = 0; j < SIZE; j++ ) {
        for( int i = 0; i < SIZE; i++ ) {
            printf("%d ", M[j * SIZE + i]);
        }
        printf("\n");
    }
    printf("Vector V:\n");
    for( int j = 0; j < SIZE; j++ ) {
        printf("%d ", V[j]);
    }
    printf("\n");
    printf("Resultant Vector R before calculation:\n");
    for( int j = 0; j < SIZE; j++ ) {
        printf("%d ", R[j]);
    }
    printf("\n");

    // Call the cuda specific function to calculate the resultant vector
    calcR<<<SIZE,SIZE>>>(M, V, R);

    cudaDeviceSynchronize();

    // Print the matrix and vector
    printf("Resultant Vector R:\n");
    for( int j = 0; j < SIZE; j++ ) {
        printf("%d ", R[j]);
    }
    printf("\n");

}