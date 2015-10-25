import subprocess
import datetime
import time

directory = "/home/motion"
while True:
	current_seconds = datetime.datetime.now().strftime("%S")
	if ((int(current_seconds))%10)==0:
		folder = datetime.datetime.now().strftime("%m-%d-%y")
		filename = datetime.datetime.now().strftime("%m-%d-%y-%H:%M:%S")
		command = "sudo fswebcam -r 640x480 -q " + directory + "/" + folder + "/" + filename + ".jpg"
		grab_cam = subprocess.Popen(command, shell=True)
		grab_cam.wait()
	time.sleep(0.5)
