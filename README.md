<!-- Do not forget to add two spaces to the end of each footnote when writing new ones -->

# Webcam-Server
A shell script to install motion packages on Raspbian
The shell script accepts 'flags' as options for what section of code to run. See Informational part 4

### TO DO:
- [X] Write a script to install motion and edit motion.conf
- [X] Edit the motion.conf file<sup>1</sup>
- [ ] Test script and motion.conf

## Informational
### 1. Purpose:
Teach students how to manage time and use other people's programs in their own modified methods.

### 2. Method:
As a student-led program, they must learn how to research topics on their lonesome or how to use each other as resources  
Use a shell script to accomplish installation and setup

### 3. Documentation:
- motion_install_setup.sh can install and can set up motion.conf for you, meaning you can start from a fresh non-gui Raspbian install.
- video files are saved to /mnt/security/videos (so set up your hard drives!)
- log files are /mnt/security/logs 
- Image port of the server is 34197<sup>3</sup>
- TCP/IP port is 34198 <sup>3</sup>
- <s>webcam_old is a collection of our old python and shell scripts, which have since been depreciated. </s>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; > Has since been moved to its own branch to prevent clutter<sup>2</sup>

### 4. Flags:
- -h: View help page
- -i: Install the program
- -c: Copy motion.conf to motion location
- -m: Mount to /mnt/security, must be ext3 and in /dev/sda1

## Footnotes:
1: Vital to finish before motion install script can be tested  
2: 'depreciated' branch holds all the old files of the project, which were previously stored haphazardly in a folder on 'master'  
3: Subject to change
