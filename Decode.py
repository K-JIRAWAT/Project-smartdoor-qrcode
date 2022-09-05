import cv2
#import qrcode
from datetime import datetime
from pyzbar.pyzbar import decode
import numpy as np
import time
#import mysql.connector
import requests


import RPi.GPIO as GPIO

GPIO.setwarnings(False)#Disable warning
GPIO.setmode(GPIO.BCM) # GPIO Numbers instead of board numbers
RELAIS_1_GPIO = 17
GPIO.setup(RELAIS_1_GPIO, GPIO.OUT) # GPIO Assign mode
GPIO.output(RELAIS_1_GPIO, GPIO.LOW) # on


timer = time.time()   #for count time in sec.



def clock(timer):
    i=0
    while True:
        if time.time() - timer >= i:
            i=i+1
            timer = time.time()
            print(i," sec")
            if i==5:
                print('stop')
                return

def unlockdoor():
    print('unlocking door')
    GPIO.output(RELAIS_1_GPIO, GPIO.HIGH) # pullback
    clock(timer)
    lockdoor()
    
def lockdoor():
    print('locking door')
    GPIO.output(RELAIS_1_GPIO, GPIO.LOW) # release

def decoder(id):   #qrcode decder and this work like a main()
    
    img_not = cv2.bitwise_not(id)
    barcode = decode(img_not)

    for obj in barcode:
        points = obj.polygon
        (x,y,w,h) = obj.rect
        pts = np.array(points, np.int32)
        pts = pts.reshape((-1, 1, 2))
        cv2.polylines(id, [pts], True, (0, 255, 0), 3)

        barcodeData = obj.data.decode("utf-8")
        barcodeType = obj.type
        string = "Data " + str(barcodeData) + " | Type " + str(barcodeType)

        cv2.putText(frame, string, (x,y), cv2.FONT_HERSHEY_SIMPLEX,0.8,(255,0,0), 2)
        print("Barcode: "+barcodeData +" | Type: "+barcodeType)
        #print(name)
        
        url = '\nhttp://0.tcp.ap.ngrok.io:12328/QR_App/qr_check.php?qr='+str(barcodeData)
        myobj = {"qr": barcodeData}
        x = requests.get(url, json = myobj)
        print(x.text)

        if(x.text=='1'):
            unlockdoor()
        elif(x.text=='0'):
            lockdoor()
        else:
            return
            


cap = cv2.VideoCapture(0)
if not cap.isOpened():
    print("Cannot open camera")
    exit()
while True:
    ret, frame = cap.read()
    cv2.resize(frame,(600,400),fx=0,fy=0, interpolation = cv2.INTER_CUBIC)
    if not ret:
        print("Can't receive frame (stream end?). Exiting ...")
        break
#     gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    decoder(frame)
    
    # Display the resulting frame
    
    cv2.imshow('frame', frame)
    if cv2.waitKey(1) == ord('q'):
        break
# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()