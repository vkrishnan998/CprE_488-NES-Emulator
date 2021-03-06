/*****************************************************************************
 * Joseph Zambreno
 * Phillip Jones
 *
 * Department of Electrical and Computer Engineering
 * Iowa State University
 *****************************************************************************/

/*****************************************************************************
 * NESCore_Callback.c - Implements the NESCore emulator callback functions, 
 * e.g. for polling controller input, displaying out, playing sound. Implement
 * the main emulation interfacing here. 
 *
 *
 * NOTES:
 * 10/25/13 by JAZ::Design created.
 *****************************************************************************/

#include "nes_bootloader.h"
#include "NESCore_Callback.h"
#include "NESCore.h"
#include <stdlib.h>

// The main output frame callback. Copy the results into the front-buffer.
// Note that the NES (and the emulator) outputs essentially a 256x240 image.
// Your challenge is to figure out how to map that to your 640x480 framebuffer.
void NESCore_Callback_OutputFrame(word *WorkFrame) {

	extern uint16_t NesPalette3[];
	uint32_t i, j;
	uint16_t *ptr = (uint16_t *)FBUFFER_BASEADDR;
	uint16_t tpixel;

	for (i = 0 ; i < NES_DISP_HEIGHT; i++) {
		for (j = 0; j < NES_DISP_WIDTH; j++) {

			// Grab a temporary pixel using the color palette lookup table.
			tpixel = NesPalette3[WorkFrame[NES_DISP_WIDTH*i+j]];

			// Doubling both axes. 4 pixels of 640x480 for every 1 pixel of 256x240
			// Converting 2D image into 1D array, so adding 640 pixels for every row and adding 64 to center the image

			ptr[640 * (2*i)  + (2*j)+64]=tpixel;
			ptr[640 * (2*i)  + (2*j+1)+64]=tpixel;
			ptr[640 * (2*i+1) + (2*j)+64]=tpixel;
			ptr[640 * (2*i+1) + (2*j+1)+64]=tpixel;

		}
	}

	// Black columns on left and right to account for unused space

	for (i = 0; i < 480; i++) {
	      for (j = 0; j < 640; j++) {
				if (j < 64 || j > 574) {
					ptr[(640 *i + j)] = 0x0000;
				}
	      }
	}

	// Flush the cache since VDMA does not play nicely with the cache
    Xil_DCacheFlush();

	return;
}


// Main input callback. Overwite the passed-by references pad1 and pad2 
// values, presumably using the buttons and switches on your ZedBoard.
void NESCore_Callback_InputPadState(dword *pdwPad1, dword *pdwPad2) {



		// Default both players to 0 to start
		*pdwPad1 = 0x0;
		*pdwPad2 = 0;

		uint32_t *button_ptr = (uint32_t*) XPAR_AXI_GPIO_1_BASEADDR;
		uint32_t *switch_ptr = (uint32_t*) XPAR_AXI_GPIO_2_BASEADDR;

		if (*button_ptr & 0x10) {
			*pdwPad1 |= NCTL_UP;
		}

		if (*button_ptr & 0x2) {
				*pdwPad1 |= NCTL_DOWN;
		}

		if (*button_ptr & 0x4) {
				*pdwPad1 |= NCTL_LEFT;
		}

		if (*button_ptr & 0x8) {
				*pdwPad1 |= NCTL_RIGHT;
		}

		if (*switch_ptr & 0x1) {
				*pdwPad1 |= NCTL_START;

		}

		if (*switch_ptr& 0x2) {
				*pdwPad1 |= NCTL_SELECT;
		}

		if (*switch_ptr & 0x4) {
				*pdwPad1 |= NCTL_A;
		}

		if (*switch_ptr & 0x8) {
				*pdwPad1 |= NCTL_B;
		}

		Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, Xil_In32(XPAR_AXI_GPIO_2_BASEADDR)); // light LEDs for any active switches
	return;
}



// Initialize the sound playback device. Ignore all the sound functions for now.
void NESCore_Callback_InitSound(void) {

  return;
}

// Configure the sound playback device
int  NESCore_Callback_OpenSound(int nSamplesPerSync, int nSampleRate) {


  return 0;
}

// Close the sound playback device
void NESCore_Callback_CloseSound(void) {

  return;
}


// Main sound playback function. It is possible that this code should just
// write to a software FIFO, with a new interrupt handler to stream in the
// appropriate burst of samples. It would seem likely that the interrupt
// handler would slow down the NES emulation, but otherwise we have to put a 
// "wait" statement which would also bog it down. Audio should not get laggy
// unless there is some bug in the NESCore in terms of how it generates frames
void NESCore_Callback_OutputSample(int nSamples, byte *channel1, 
				   byte *channel2, byte *channel3, 
				   byte *channel4, byte *channel5) {

  return;
}


inline void play_next_squeue() {


  return;

}




// Define the global NES pallete array here. This would not be needed
// if we build a custom nes-specific display controller.

word NesPalette[64] = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 
  10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
  20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
  30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
  40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
  50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 
  60, 61, 62, 63, 64};


// Improved NES Palette
uint32_t NesPalette2[65] = {
  0x000000,
  0x808080, 0x003da6, 0x0012b0, 0x440096,
  0xa1005e, 0xc70028, 0xba0600, 0x8c1700,
  0x5c2f00, 0x104500, 0x054a00, 0x00472e,
  0x004166, 0x000000, 0x050505, 0x050505,
  0xc7c7c7, 0x0077ff, 0x2155ff, 0x8237fa,
  0xeb2fb5, 0xff2950, 0xff2200, 0xd63200,
  0xc46200, 0x358000, 0x058f00, 0x008a55,
  0x0099cc, 0x212121, 0x090909, 0x090909,
  0xffffff, 0x0fd7ff, 0x69a2ff, 0xd480ff,
  0xff45f3, 0xff618b, 0xff8833, 0xff9c12,
  0xfabc20, 0x9fe30e, 0x2bf035, 0x0cf0a4,
  0x05fbff, 0x5e5e5e, 0x0d0d0d, 0x0d0d0d,
  0xffffff, 0xa6fcff, 0xb3ecff, 0xdaabeb,
  0xffa8f9, 0xffabb3, 0xffd2b0, 0xffefa6,
  0xfff79c, 0xd7e895, 0xa6edaf, 0xa2f2da,
  0x99fffc, 0xdddddd, 0x111111, 0x111111
};

// 16-bit version of the improved NES Palette
uint16_t NesPalette3[65] = {
		0x0000, 0x0888, 0x0A30, 0x0B10, 0x0904,
		0x050A, 0x020C, 0x000B, 0x0018, 0x0025,
		0x0041, 0x0040, 0x0240, 0x0640, 0x0000,
		0x0000, 0x0000, 0x0CCC, 0x0F70, 0x0F52,
		0x0F38, 0x0B2E, 0x052F, 0x002F, 0x003D,
		0x006C, 0x0083, 0x0080, 0x0580, 0x0C90,
		0x0222, 0x0000, 0x0000, 0x0FFF, 0x0FD0,
		0x0FA6, 0x0F8D, 0x0F4F, 0x086F, 0x038F,
		0x019F, 0x02BF, 0x00E9, 0x03F2, 0x0AF0,
		0x0FF0, 0x0555, 0x0000, 0x0000, 0x0FFF,
		0x0FFA, 0x0FEB, 0x0EAD, 0x0FAF, 0x0BAF,
		0x0BDF, 0x0AEF, 0x09FF, 0x09ED, 0x0AEA,
		0x0DFA, 0x0FF9, 0x0DDD, 0x0111, 0x0111};
