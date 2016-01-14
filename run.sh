#!/bin/bash

./set_current.sh

#install dependencies
sudo apt-get install -y fswebcam

sudo python3 webcam.py
