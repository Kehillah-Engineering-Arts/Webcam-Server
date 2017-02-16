<!-- Do not forget to add two spaces to the end of each footnote when writing new ones -->

# Webcam-Server
A shell script to install motion packages on Rapbian

## TO DO:
- [X] Write a script to install motion and edit motion.conf
- [X] Edit the motion.conf file<sup>1</sup>
- [ ] Test script and motion.conf

### 1. Purpose:
Teach students how to manage time and use other people's programs in their own modified methods.

### 2. Method:
As a student-led program, they must learn how to research topics on their lonesome or how to use each other as resources  
Use a shell script to accomplish installation and copy

### 3. Documentation:
- motion_install_setup.sh installs and sets up motion.conf for you, meaning you can start from a fresh non-gui Raspbian install.
- video files are saved to /mnt/security/videos (so set up your hard drives!)
- log files are /mnt/security/logs 
- Image port of the server is 34197<sup>3</sup>
- TCP/IP port is 34198 <sup>3</sup>
- <s>webcam_old is a collection of our old python and shell scripts, which have since been depreciated. </s>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; > Has since been moved to its own branch<sup>2</sup>

### Footnotes:
1: Vital to finish before motion install script can be tested  
2: 'depreciated' branch holds all the old files of the project, which were previously stored haphazardly in a folder on 'master'  
3: Subject to change