#include <stdio.h>
#include <cuda_runtime.h>

#define ARRAY_SIZE 10

// CUDA kernel
__global__ void calcMatrixElement() {
}

int main(void) {
    int* M;
    int* V;

    M = (int*)malloc(ARRAY_SIZE * ARRAY_SIZE * sizeof(int));
    V = (int*)malloc(ARRAY_SIZE * sizeof(int));

    cudaMalloc(&M, ARRAY_SIZE * ARRAY_SIZE * sizeof(char));
    cudaMalloc(&V, ARRAY_SIZE * sizeof(char));

    for( int j = 0; j < ARRAY_SIZE; j++ ) {
        for( int i = 0; i < ARRAY_SIZE; i++ ) {
            M[j * ARRAY_SIZE + i] = i + 1;
        }
    }

    for( int j = 0; j < ARRAY_SIZE; j++ ) {
        V[j] = j + 1;
    }

    // Print the matrix and vector
    printf("Matrix M:\n");
    for( int j = 0; j < ARRAY_SIZE; j++ ) {
        for( int i = 0; i < ARRAY_SIZE; i++ ) {
            printf("%d ", M[j * ARRAY_SIZE + i]);
        }
        printf("\n");
    }
    printf("Vector V:\n");
    for( int j = 0; j < ARRAY_SIZE; j++ ) {
        printf("%d ", V[j]);
    }

}