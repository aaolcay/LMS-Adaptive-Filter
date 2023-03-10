# LMS-Adaptive-Filter
This repository includes LMS-Adaptive algorithm implementation. We commented why specifically each step was coded in the lines. First, we looked at the magnitude spectrum of the signal loaded (an eeg signal reference: Professor David Simpson, University of Southampton) to detect at which frequency noise appears. The signal loaded in this implementation suffers from mains noise (50 Hz) and the fundamentatl frequency is below 1 Hz. Considering that, we used a low-pass Butterworth with 0.7 Hz cut-off in order to remove the noise introduced in the signal. After filtering, the signal obtained is the denoised signal and was used as the desired signal. We did not compare the results just see them on plots. This repository includes (latest update: 15/02/2023):
- eeg.mat : This is a mat file including the signal which we applied Butterworth IIR Filter and LMS-Adaptive algorithm
- LMS_adaptive_algorithm.m : MATLAB code

**Note: This repository will be extended, if I can find enough time, to incorporate different adaptive algorithms and their detailed comparison.**
