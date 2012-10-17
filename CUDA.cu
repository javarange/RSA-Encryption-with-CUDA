/***************************************
 * CUDA.cu
 * Author: Andrei Kopytov
 * Date of creation: Oct 12, 2012
 * Last modified: Oct 17, 2012
 **************************************/
 
#include "CUDA.h"
#include <iostream>
using std::cout;
using std::endl;

// Static members
int		CUDA::m_numDevices = 0;
int 	CUDA::m_activeDeviceID = 0;
bool 	CUDA::m_cudaSupported = 0;
bool 	CUDA::m_cudaInitialized = 0;
int 	CUDA::m_maxThreadsPerMultiProcessor = 0;

__global__ void kernel()
{
	// TODO: parallelize BigInt's longMultiply() function
}

bool CUDA::checkForCUDASupport()
{
	cudaError_t error;
	
	error = cudaGetDeviceCount(&m_numDevices);
	if (error != cudaSuccess) {
		cout << cudaGetErrorString(error) << endl;
	}
	if (!m_numDevices) {
		cout << "No CUDA capable devices found!" << endl;
		return false;
	}
	
	return true;
}

void CUDA::initializeCUDA()
{
	cudaError_t error;
	m_cudaInitialized = false;
	
	m_cudaSupported = checkForCUDASupport();
	if (!m_cudaSupported) {
		cout << "CUDA could not be initialized properly. Defaulting to serial processing!" << endl;
		return;
	}
	
	/* We're going to choose the first available CUDA device. In the future this can be modified
	 * to go through all available CUDA devices and choose the best/most capable one, or to utilize all
	 * available devices for parallel processing.
	 */
	error = cudaGetDevice(&m_activeDeviceID);
	if (error != cudaSuccess) {
		cout << cudaGetErrorString(error) << endl;
		return;
	}
	cudaDeviceProp properties;
	error = cudaGetDeviceProperties(&properties, m_activeDeviceID);
	if (error != cudaSuccess) {
		cout << cudaGetErrorString(error) << endl;
		return;
	}
	
	m_maxThreadsPerMultiProcessor = properties.maxThreadsPerMultiProcessor;
	m_cudaInitialized = true;
}

bool CUDA::isSupported()
{
	return m_cudaSupported;
}

bool CUDA::isInitialized()
{
	return m_cudaInitialized;
}

void CUDA::launchGrid(unsigned long int na, unsigned long int nb, unsigned char* result)
{
	// TODO: figure out the correct data types and allocate memory for them
}