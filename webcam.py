import subprocess
import datetime
import time
import os

"""
This program should probably run itself in a screen
"""

directory = "/home/motion"
while True: #Should the loop stop if a button is pressed in the window where it runs?
	current_seconds = datetime.datetime.now().strftime("%S")
	if ((int(current_seconds))%1) == 0:
		folder = datetime.datetime.now().strftime("%m-%d-%y")
		fullPath = directory + "/" + folder
		if not os.path.exists(fullPath):
			os.makedirs(fullPath)
		filename = datetime.datetime.now().strftime("%m-%d-%y-%H_%M_%S")
		command = "sudo fswebcam -r 640x480 -q " + fullPath + "/" + filename + ".jpg" #Can this be done without rootuser?
		grab_cam = subprocess.Popen(command, shell=True)
		grab_cam.wait()
	time.sleep(0.5)

