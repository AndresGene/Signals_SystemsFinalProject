Instructions to running MATLAB program ValorantxSignals.
To run this MATLAB file, a Windows 10+ Operating system, or a Mac with iOS version of 12.3+ can be used.
Install Matlab2020 along with the following toolboxes: Audio, Communications, DSP System, Image Processing, Signal Processing, Simulink and Symbolic Math
	Note: This will work on MatLab2021 and MatLab2022 as well, assuming the same toolboxes are installed
Steps to run this project in MATLAB:

1: Download the project named "ValorantxSignals.m" to your computer
2: Once the file is finished downloading, locate the file and open it. 
3. If "ValorantxSignals.m" file is not opened in the editor tab, click the editor tab, which is the tab that is above in the MATLAB toolbar.
4. In the above MATLAB toolbar, locate and press the (triangular) PLAY icon labeled "Run" to run the MATLAB file.
5. Once played, the audio wave will automatically begin playing and five figures will be generated in the popup tabs.
	Once done, add a "%" symbol to the left most first character of line 43
6a. To play the music that is generated with White Gaussian Noise, remove the "%" symbol that is the first character on line 108.
	Once done, add a "%" symbol to the left most first character of line 108
    To play the music that is generated with filtered White Gaussian Noise, remove the "%" symbol that is in the first character on line 148
	Once done, add a "%" symbol to the left most first character of line 148
	6b. (Make sure the required toolboxes (listed above) are downloaded for this part of the program to work correctly).
7. To listen to the music without the graphs appearing, click any of the .wav files and click on the option that says "Open Outside of MATLAB".

Troubleshooting tips should any of the following errors occur:
1. Error in MATLAB saying the file is not found in the current folder
	- Click on the "Add to Path" option. This will allow the program to run.
2. The figures do not pop up when the program is running:
	- Run the program again after closing all other figures that appeared.
	- If the issue continues to persist, restart MATLAB.
3. Error in MATLAB stating that the application cannot create a ".wav" file:
	- Run the program again after closing the music player.
4. MATLAB does not have the tabs found at the top of MATLAB when the program file was opened.
	- Go to the desired file, then double click the file to open it. The tabs should then appear.
5. MATLAB unable to run because of internal device issues.
	- Restart the computer being used and the MATLAB application. Open the file again and run the program as described above.

Note: Disregard warnings as they do not prevent the code from running! 