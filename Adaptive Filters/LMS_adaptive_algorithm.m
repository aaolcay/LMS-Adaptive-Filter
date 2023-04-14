clc; clear;close all;
% ~~~~~~~~~~~~~~~~~~ Abdullah Olcay ~~~~~~~~~~~~~~~~~~
% ~~~~~~~~~~~~ University of Southampton ~~~~~~~~~~~~~
%% load data and visuaize waveform
load('eeg.mat');
x=eeg;
x=x-mean(x);
t = (0:length(x)-1)/fs;
figure; 
plot(t,x); xlabel('t (s)');ylabel('a.u.');
x=x.';
%% visualize magnitude spectrum of signal
X = fft(x);
X = abs(X(1:length(X)/2));
df = fs/length(x);
f= 0:df:(fs/2)-df;
figure;
plot(f,X); xlabel('f (Hz)');ylabel('magnitude');

%% IIR Filter (Low Pass Filter With 0.7 Hz cut-off frequency)
% we are going to remove mains noise at 50 Hz and this will be our
% desired signal to eliminate the noise introduced in the original
% signal's waveform by using further LMS adaptive algorithm
fc=0.7; % cut off frequency
fn=fs/2; % nyquist frequency = sample frequency/2;
order = 6; % 6 order filter, low pass
[b,a]=butter(order,(fc/fn),'low');
desired_signal = filtfilt(b, a, x); % use filtfilt as IIR filter causes delay in time domain signal

%% LMS-adaptive algorithm
M = 2048; % tap length
wi = zeros(1,M); % weights are initialized by zeros
record_error = [];
E = [];
alpha = 0.0000005; % step size
count=1;
s=1;

for i = M:length(x)
    x_n = x(i:-1:i-M+1);
    E(i) = desired_signal(i) - wi*x_n'; % this finds the original signal that is the closest to the desired signal
    wi = wi + 2*alpha*E(i)*x_n; % update weights
    record_error(count) = abs(E(i));
    count = count+1;
end

est = [];
for i = M:length(x)
    x_n = x(i:-1:i-M+1);
    estimated_signal(i) =  wi*x_n';
end

figure;
subplot(3,1,1);
plot(t,x); xlabel('t (s)');ylabel('a.u.');
legend('original signal');
subplot(3,1,2);
plot(t,desired_signal); xlabel('t (s)');ylabel('a.u.');
legend('filtered signal');
subplot(3,1,3);
plot(t,estimated_signal); xlabel('t (s)');ylabel('a.u.');
legend('LMS applied');
