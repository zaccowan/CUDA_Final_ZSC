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

    cudaMalloc(&M, SIZE * SIZE * sizeof(int));
    cudaMalloc(&V, SIZE * sizeof(int));
    cudaMalloc(&R, SIZE * sizeof(int));

    for( int j = 0; j < SIZE; j++ ) {
        for( int i = 0; i < SIZE; i++ ) {
            M[j * SIZE + i] = i + 1;
        }
    }

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

    calcR<<<SIZE,SIZE>>>(M, V, R);

    cudaDeviceSynchronize();

    // Print the matrix and vector
    printf("Resultant Vector R:\n");
    for( int j = 0; j < SIZE; j++ ) {
        printf("%d ", R[j]);
    }
    printf("\n");

}