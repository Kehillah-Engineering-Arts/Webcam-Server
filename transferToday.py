import datetime
import shutil

# if hardrive not plugged in, skip
# check all folders
# if not today's folder, transfer to hardrive

piDir = "/home/motion"
destination = "/home/pi/storage"
today = datetime.date.today()
folder = today.strftime("%m-%d-%y")
shutil.move(piDir + "/" + folder, destination)