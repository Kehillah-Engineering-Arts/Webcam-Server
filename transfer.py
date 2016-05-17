import datetime
import shutil

# if hardrive not plugged in, skip
# check all folders
# if not today's folder, transfer to hardrive

piDir = "/home/motion"
destination = "/mnt/USB" #Location where storage device is mounted
today = datetime.date.today()
yesterday = today - datetime.timedelta(days=1)
folder = yesterday.strftime("%m-%d-%y")
shutil.move(piDir + "/" + folder, destination)
thirtydaysago = today - datetime.timedelta(days=30)
folder = thirtydaysago.strftime("%m-%d-%y")
shutil.rmtree(destination+"/"+folder, True)
