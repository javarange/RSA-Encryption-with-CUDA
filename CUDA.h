/***************************************
 * CUDA.h
 * Author: Andrei Kopytov
 * Date of creation: Oct 12, 2012
 * Last modified: Oct 17, 2012
 **************************************/

#ifndef CUDA_H_
#define CUDA_H_

#include <cuda_runtime.h>

class CUDA
{
	private:
		static int m_numDevices;
		static int m_activeDeviceID;
		static bool m_cudaSupported;
		static bool m_cudaInitialized;
		static int m_maxThreadsPerMultiProcessor;
		static bool checkForCUDASupport();
	public:
		static void initializeCUDA();
		static bool isSupported();
		static bool isInitialized();
		static void launchGrid(unsigned long int, unsigned long int, unsigned char*);
};

#endif // CUDA_H_