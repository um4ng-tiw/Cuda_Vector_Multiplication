#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1000000


//Kernel to perform the multiplication of array elements
__global__ void vect_mul(int*a, int *b, int*c)
{

    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if(tid < N)
        c[tid]=a[tid]*b[tid];
    
}

void vect_mul_cpu(int* a, int* b, int* c)
{
    for(int i=0;i<N;i++)
    {
        a[i]=b[i]*c[i];
    }
}


int* initialize(int* ptr)
{
    for(int i=0;i<N;i++)
    {
        ptr[i]=rand() % 10000;
    }

    return ptr;
}

int main()
{
    //Array declaration and initialization for CPU side
    int *a = (int*)malloc(N*sizeof(int));
    int *b = (int*)malloc(N*sizeof(int));

    //Initializing array with random values
    a=initialize(a);
    b=initialize(b);


    int* c = (int*)malloc(N*sizeof(int)); //For cpu execution

    int *ptr_c_cpu =(int*)malloc(N*sizeof(int)); //For copying value from gpu to cpu

    int *ptr_a_cpu = a;
    int *ptr_b_cpu = b;


    cudaEvent_t start,stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    
    
    //Declaring pointer variables for the GPU
    int *ptr_a_gpu;
    int *ptr_b_gpu;
    int *ptr_c_gpu;

    //Allocating memory to pointer variables in the GPU
    cudaMalloc((void **)&ptr_a_gpu, N * sizeof(int));
    cudaMalloc((void **)&ptr_b_gpu, N * sizeof(int));
    cudaMalloc((void **)&ptr_c_gpu, N * sizeof(int));

    //Copying contents of variable from cpu(host) to gpu(device)
    cudaMemcpy(ptr_a_gpu, ptr_a_cpu, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(ptr_b_gpu, ptr_b_cpu, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(ptr_c_gpu, ptr_c_cpu, N * sizeof(int), cudaMemcpyHostToDevice);

    //Calling the kernel to perform execution on gpu
    cudaEventRecord(start);
    vect_mul<<<1000,1000>>>(ptr_a_gpu,ptr_b_gpu,ptr_c_gpu);
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);

    //Copying the result array from gpu(device) to cpu(host)
    cudaMemcpy(ptr_c_cpu,ptr_c_gpu,N*sizeof(int),cudaMemcpyDeviceToHost);
    

    float time_taken_gpu = 0.0;
    cudaEventElapsedTime(&time_taken_gpu, start, stop);


    clock_t t;
    t=clock();
    vect_mul_cpu(a,b,c); //Calling the function for cpu execution
    t=clock()-t;
    double time_taken_cpu = ((double)t)/CLOCKS_PER_SEC; //Recorded in seconds
    time_taken_cpu*=1000.0;


    printf("Time taken by CPU:%f ms\n",time_taken_cpu);
    printf("Time taken by GPU:%f ms\n",time_taken_gpu);
  

    //Freeing space in host memory
    free(ptr_c_cpu);
    free(a);
    free(b);
    free(c);

    //Freeing space in gpu
    cudaFree(ptr_a_gpu);
    cudaFree(ptr_b_gpu);
    cudaFree(ptr_c_gpu);
}


