# LMS-Adaptive-Filter
This repository includes LMS-Adaptive algorithm implementation. We commented why specifically each step was coded in the lines. First, we looked at the magnitude spectrum of the signal loaded (an eeg signal reference: Professor David Simpson, University of Southampton) to detect at which frequency noise appears. The signal loaded in this implementation suffers from mains noise (50 Hz) and the fundamentatl frequency is below 1 Hz. Considering that, we used a low-pass Butterworth with 0.7 Hz cut-off in order to remove the noise introduced in the signal. After filtering, the signal obtained is the denoised signal and was used as the desired signal. We did not compare the results just see them on plots. This repository includes (latest update: 15/02/2023):
- eeg.mat : This is a mat file including the signal which we applied Butterworth IIR Filter and LMS-Adaptive algorithm
- LMS_adaptive_algorithm.m : MATLAB code

# Matched Filter
One of the fixed-filters is implemented in 'PSK_encoder_matched_filter_decoder.ipynb'. The code generates a message signal and a carrier signal, encodes the message signal using Phase Shift Keying (PSK), adds noise to the PSK signal, and then decodes the message signal using a matched filter. Finally, it plots various signals and prints the original and decoded message signals.

More specifically, the code first defines a message signal consisting of 0's and 1's, and a carrier signal with a sampling rate of 192 kHz and a frequency of 32 kHz. It then encodes the message signal using PSK modulation and creates a PSK signal. The PSK signal is then corrupted with noise generated from a normal distribution.

The code then defines a matched filter and uses it to filter the noisy PSK signal. The filtered signal is then decoded by comparing its maximum values with the carrier signal. The original message signal is then printed along with the decoded message signal, which is obtained after thresholding the filtered signal. Finally, the code plots the original message signal, carrier signal, PSK-encoded signal, noisy signal, filtered signal, and decoded signal.
#
**Note: This repository will be extended, if I can find enough time, to incorporate different adaptive algorithms and their detailed comparison.**

The latest update has been made on 14.04.2023
