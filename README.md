[![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed by Marine SILVIN, (http://ici.igbmc.fr/) under a
[Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg


## Table of Contents
1. [StackFocuser-Batch](#StackFocuser-Batch)
2. [Requirements](#Requirements)
3. [How to install/run the macro](#How-to-run/install-the-macro)
4. [Outputs](#Outputs)



# StackFocuser-Batch
 Fiji macro to use the Stack Focuser in batch from czi stack file.
 The goal was to apply the Stack Focuser in order to do an Extended Depth Focus (EDF) on czi files.
 So the macro will open the czi files one by one and split the images. It takes the C2 channels (green) and invert the values of the images. And with a substraction of the background then an application of the stack focuser, we obtain the images that we wanted.
 
### Requirements
* Stack Focuser installation
* Fiji version 1.53p or more
* czi files
* stack

## How to install/run the macro
Drag&Drop in Fiji. Click on "run".

## Outputs
The result of the processing after just the invert and substract background process in a tif images. Plus, we save the result of the Stack Focuser treatment.



