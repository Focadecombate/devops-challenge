import os
import glob
from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive

def _main_():
    g_login = GoogleAuth()
    g_login.LocalWebserverAuth()
    drive = GoogleDrive(g_login)
    for file in glob.glob("*.json"):
        if file == "client_secrets.json":
            return
        print(file)
        with open(file, "r") as f:
            fn = os.path.basename(f.name)
            file_drive = drive.CreateFile({'title': fn})
            file_drive.SetContentString(f.read())
            file_drive.Upload()
        print("The file: " + fn + " has been uploaded")

_main_()

print("All files have been uploaded")
