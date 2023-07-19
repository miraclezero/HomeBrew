#!/usr/bin/python

#from picamera import PiCamera
import time
#import argparse

import board
import neopixel

#camera = PiCamera()
#camera.resolution = (1920, 1080)
#camera.framerate = 30
#camera.brightness= 55

pixels = neopixel.NeoPixel(board.D18, 12, pixel_order=neopixel.RGBW)
for i in range(12):
	pixels[i] = (0, 0, 0, 255)

