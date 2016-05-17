import subprocess
import datetime
import time
import os

#directory = "/home/motion"
directory = "~/motion"
while True:
	current_seconds = datetime.datetime.now().strftime("%S")
	if ((int(current_seconds))%10)==0:
		folder = datetime.datetime.now().strftime("%m-%d-%y")
		fullPath = directory + "/" + folder
		if not os.path.exists(fullPath):
			os.makedirs(fullPath)
		else:
			print("fullPath" + fullPath)
		filename = datetime.datetime.now().strftime("%m-%d-%y-%H:%M:%S")
		command = "sudo fswebcam -r 640x480 -q " + fullPath + "/" + filename + ".jpg"
		grab_cam = subprocess.Popen(command, shell=True)
		grab_cam.wait()
	time.sleep(0.5)
