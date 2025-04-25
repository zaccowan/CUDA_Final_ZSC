#include <stdio.h>
#include <cuda_runtime.h>

#define SIZE 10

// CUDA kernel
__global__ void calcMatrixElement(int* M,int* V) {

    int i = blockIdx.x;
    int j = threadIdx.x;

    M[i * SIZE + j] = M[i * SIZE + j] * V[j];
}

int main(void) {
    int* M;
    int* V;

    // Allocate memory + Syncrohnize between CPU and GPU
    cudaMalloc(&M, SIZE * SIZE * sizeof(int));
    cudaMalloc(&V, SIZE * sizeof(int));

    // Fill the matrix where a given element is the column index + 1
    for( int j = 0; j < SIZE; j++ ) {
        for( int i = 0; i < SIZE; i++ ) {
            M[j * SIZE + i] = i + 1;
        }
    }

    // Fill the vector where a given element is the index + 1
    for( int j = 0; j < SIZE; j++ ) {
        V[j] = j + 1;
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


    // Call the cuda specific function to calculate the resultant matrix
    // Each thread will calculate one element of the resultant matrix
    calcMatrixElement<<<SIZE,SIZE>>>(M, V);

    cudaDeviceSynchronize();

    // Print the matrix and vector
    printf("Resultant Matrix M:\n");
    for( int j = 0; j < SIZE; j++ ) {
        for( int i = 0; i < SIZE; i++ ) {
            printf("%d ", M[j * SIZE + i]);
        }
        printf("\n");
    }

    cudaFree(M);
    cudaFree(V);

}