import subprocess
import datetime
import time
import os

#directory = "/home/motion"
directory = "~/motion"
while True:
	current_seconds = datetime.datetime.now().strftime("%S")
	if ((int(current_seconds))%10)==0:
		print(1)
		folder = datetime.datetime.now().strftime("%m-%d-%y")
		print(2)
		fullPath = directory + "/" + folder
		print(3)
		if not os.path.exists(fullPath):
			os.makedirs(fullPath)
		print(4)
		filename = datetime.datetime.now().strftime("%m-%d-%y-%H:%M:%S")
		print(5)
		command = "sudo fswebcam -r 640x480 -q " + fullPath + "/" + filename + ".jpg"
		print(6)
		grab_cam = subprocess.Popen(command, shell=True)
		print(7)
		grab_cam.wait()
		print(8)
	time.sleep(0.5)
