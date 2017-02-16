# Webcam-Server (depreciated branch)
Old files we created. They don't work very well.

## TO DO:
- [X] Nothing

### 1. Purpose:
To teach students how to create webcams in python and to use the webcam to monitor the LEA

### 2. Method:
As a student-led program, they must learn how to research topics on their lonesome or how to use each other as resources

### 3. Documentation:

#### webcam.py (Main Camera File):
- Imports: subprocess, datetime, time, os
- Goal: takes an image and saves it as month-day-year-hour-minute-second.
- Issues: only takes one image, then stops.
```python
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
```

#### transferToday.py (Midnight File Transfers):
- Imports: datetime, os
- Goal: transfer files from RasPi SD card to attached HDD
- Issues: --
```python
# if hardrive not plugged in, skip
# check all folders
# if not today's folder, transfer to hardrive

piDir = "/home/motion"
destination = "/mnt/USB"
today = datetime.date.today()
folder = today.strftime("%m-%d-%y")
print("mv " + piDir + "/" + folder + " " + destination)
os.system("mv " + piDir + "/" + folder + " " + destination)
```