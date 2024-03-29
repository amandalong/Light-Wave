# Light-Wave


Note this project began in 2014 and used a raspberry pi B version 1.2. It then was updated in fall 2020 for the P 4. 
It runs a live feed from a camera to a LED display 16 x 21. 

![preview](https://github.com/amandalong/amandalong/blob/85254732b372ce10712ec8245e966ca3918a77f1/Images/live%20feed%20neopixels%20LEDs%20with%20fadecandy.jpg)

The following materials are required:

-Canvas 

-Adafruit Neopixels 

-2 fadecandy boards

-Logitech camera

-Raspberry Pi 4

-Mini SD card

-USB charger for Pi at least a 1.5A one

-5 Volt Power Supply - 40A Single Output (https://www.circuitspecialists.com/5-volt-40-amp-power-supply.html)

-Power cable plug - 110 (https://www.amazon.com/gp/product/B06XQZFD36/ref=ox_sc_act_title_1?smid=AKX4PUL0YEZW2&psc=1)

-wire

-electrical tape 

-soldering iron 

-HD Dispay (this can be removed after the install)

-HMDI cable


Here is how to run it. 


1) The power cord is for the inverter before you plug it make sure the 220/110 switch inside is set to 110

2) Connect the red and black cables from the LED screen to the power supply. Red cables go to any last 3 slots, black to any 3 middle ones. 

3) Connect the usb camera, and each Fadecandy with a usb cable to the Pi.

4) Plug in the LED charger

5) Connect Pi to a USB charger 

6) Pi should boot and autorun the app on the pde files are installed on the Pi sd mini card. 
It takes 3 minutes 30 second for the boot. During that time nothing will happen so you have to be patient. 


# Setting Up the Pi 4 with the app

Open the terminal on the Pi. Run each command to set up the system:

sudo apt-get install libtiff5-dev libjasper-dev libpng12-dev

sudo apt-get install libjpeg-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

sudo apt-get install libgtk2.0-dev

sudo apt-get install libgtk-3-dev

sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install libatlas-base-dev git

sudo apt-get install python3-pip

pip3 install numpy

pip3 install opencv-python

git clone https://github.com/scanlime/fadecandy

cp fadecandy/examples/python/opc.py ~/Desktop/opc.py

fcserver

git clone https://github.com/nikolozka/ledcam

cd ledcam

cp ~/Desktop/opc.py opc.py 

python3 usbcam.py


----
Check the json is file is the correct folder 
sudo find / -name "fcserver*"
/usr/local/bin/fcserver.json


#Change the serial number to match your FadeCandy boards
The brightness can be changed too by altering the white point

{
	"listen": [null, 7890],
	"verbose": true,
 
	"color": {
		"gamma": 2.5,
		"whitepoint": [0.7, 0.7, 0.7]
	},
 
	"devices": [
		{
			"type": "fadecandy",
			"serial": "GWMWBJKSCCNVVLED",
			"map": [
                                [ 0,  168, 512, 21 ],
				[ 0,  188, 576, 21 ],
				[ 0,  209, 640, 21 ],
				[ 0,  230, 704, 21 ],
				[ 0,  251, 768, 21 ],
				[ 0,  272, 832, 21 ],
				[ 0,  293, 896, 21 ],
				[ 0,  314, 960, 21 ]

			]
		},
		{
			"type": "fadecandy",
			"serial": "YUFMPVJBVDHNLXOT",
			"map": [
				[ 0,    0,   0, 21 ],
				[ 0,   21,  64, 21 ],
				[ 0,   42, 128, 21 ],
				[ 0,   63, 192, 21 ],
				[ 0,   84, 256, 21 ],
				[ 0,  105, 320, 21 ],
				[ 0,  126, 384, 21 ],
				[ 0,  147, 448, 21 ]

			]
		}
	]
}



# Run LightWave
To run it in one terminal window type (or up arrow :) 

sudo /usr/local/bin/fcserver /usr/local/bin/fcserver.json


and leave it. In another:

python3 ~/ledcam/usbcam.py 
