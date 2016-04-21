#!/bin/bash

sudo ./set_current.sh

#install dependencies
sudo apt-get install -y fswebcam

echo "~~~~> Capturing Images!! <~~~~"
sudo python3 webcam.py
