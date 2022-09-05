import qrcode
from datetime import datetime
import time
import mysql.connector

def create_pic(id):
        # datetime object containing current date and time

        input_data = str(id)
        #Creating an instance of qrcode
        qr = qrcode.QRCode(
                version=1,
                box_size=10,
                border=5)
        qr.add_data(input_data)
        qr.make(fit=True)
        img = qr.make_image(fill='black', back_color='white')
        print(input_data)
        img.save('user_qrcode/'+input_data+'.jpg')




print("Please input name: ")
name = input()

create_pic(name)



