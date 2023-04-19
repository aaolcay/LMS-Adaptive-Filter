This repository includes different filter implementations and methods in the digital signal processing, primarily focusing on adaptive and matched filters.
# LMS-Adaptive-Filter
The folder 'Adaptive Filters' includes LMS-Adaptive algorithm application. We commented why specifically each step was coded in the lines. First, we looked at the magnitude spectrum of the signal loaded (an eeg signal reference: Professor David Simpson, University of Southampton) to detect at which frequency noise appears. The signal loaded in this implementation suffers from mains noise (50 Hz) and the fundamentatl frequency is below 1 Hz. Considering that, we used a low-pass Butterworth with 0.7 Hz cut-off in order to remove the noise introduced in the signal. After filtering, the signal obtained is the denoised signal and was used as the desired signal. We did not compare the results just see them on plots. This repository includes (latest update: 15/02/2023):
- eeg.mat : This is a mat file including the signal which we applied Butterworth IIR Filter and LMS-Adaptive algorithm
- LMS_adaptive_algorithm.m : MATLAB code

# Matched Filter
One of the fixed-filters is implemented in 'PSK_encoder_matched_filter_decoder.ipynb'. The code generates a message signal and a carrier signal, encodes the message signal using Binary Phase Shift Keying (BPSK), adds noise to the BPSK signal, and then decodes the message signal using a matched filter. Finally, it plots various signals and prints the original and decoded message signals.

More specifically, the code first defines a message signal consisting of 0's and 1's, and a carrier signal with a sampling rate of 192 kHz and a frequency of 32 kHz. It then encodes the message signal using BPSK modulation and creates a BPSK signal. The BPSK signal is then corrupted with noise generated from a normal distribution.

The code then defines a matched filter and uses it to filter the noisy BPSK signal. The filtered signal is then decoded by comparing its maximum values with the carrier signal. The original message signal is then printed along with the decoded message signal, which is obtained after thresholding the filtered signal. Finally, the code plots the original message signal, carrier signal, BPSK-encoded signal, noisy signal, filtered signal, and decoded signal.

# Hilbert Transform
This folder defines envelope detection with Hilbert Transform (or analytical form of a signal). Python notebook includes a tutorial with the code including a class called "EnvelopeDetection" that performs envelope detection on a given signal. The envelope detection is performed using the Hilbert transform, and the amplitude envelope of the signal is computed from the resulting analytic signal⌘.

The constructor method of the EnvelopeDetection class takes in a signal and its sampling rate, and a boolean flag to indicate whether or not to plot the original signal and its envelope. The class contains three functions: perform_hilbert_transform, detect_envelope, and plot_envelope. The perform_hilbert_transform function applies the Hilbert transform to the input signal, detect_envelope computes the absolute value of the resulting analytic signal, and plot_envelope plots the original signal and its amplitude envelope.

The code also defines a function called "envelope_detection" that takes in a signal and its sampling rate, and performs envelope detection using the EnvelopeDetection class. The function returns the computed envelope and the original signal.

Finally, the code generates a test signal and performs envelope detection on it using the EnvelopeDetection class. It also loads an original audio signal, performs envelope detection on it using the envelope_detection function, and plots the resulting envelope.

⌘In signal processing, an analytic signal is a complex-valued signal that has no negative frequency components.

#
**Note: This repository will be extended, if I can find enough time, to incorporate different adaptive algorithms and fixed filters with their detailed comparisons.**

The latest update has been made on 19.04.2023
