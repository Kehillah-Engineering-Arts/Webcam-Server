import datetime
import shutil
import os

# if hardrive not plugged in, skip
# check all folders
# if not today's folder, transfer to hardrive

piDir = "/home/motion"
destination = "/mnt/USB"
today = datetime.date.today()
folder = today.strftime("%m-%d-%y")
os.system("mv " + piDir + "/" + folder + " " + destination)
