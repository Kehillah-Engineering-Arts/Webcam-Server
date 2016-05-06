import datetime
import shutil

piDir = "/home/motion"
destination = "/mnt/USB" #Location where storage device is mounted
today = datetime.date.today()
yesterday = today - datetime.timedelta(days=1)
folder = yesterday.strftime("%m-%d-%y")
shutil.move(piDir + "/" + folder, destination)
thirtydaysago = today - datetime.timedelta(days=30)
folder = thirtydaysago.strftime("%m-%d-%y")
shutil.rmtree(destination+"/"+folder, True)
