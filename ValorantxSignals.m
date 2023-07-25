%Valorant X Signals by Zedd
%Andreas Vhlaos, Andres Gene
%Assignment
%Compose 5-10 seconds of music of your own choice based on the instructions given in Appendix A and accomplish the following tasks:
%(1) Plot the time and frequency domain components of the music you created;
%(2) Explain the output of your graphs according to your design.
%(3) Plot the spectrogram of the music you created and explain your findings from the generated spectrogram.

clear; %to remove all variables from workspace

%Sampling frequency(Hz)
FS = 11000; %Code to generate the music notes for this collaborative piece using A, B flat, C, D, E and Eflat, F sharp, and G, in different octaves, and of varying durations

a_low = sin(2*pi*220.00*(0:0.00015000:0.55));                 %a_low is in the 4th octave
a_high = sin(2*pi*440.00*(0:0.00015000:0.55));
a_low_q = sin(2*pi*220.00*(0:0.00015000:0.3));                %a_low_q is A in the 4th octave but the note is played quicker

b_fla = sin(2*pi*466.1638*(0:0.00015000:0.55));

c_5 = sin(2*pi*523.2511	*(0:0.00015000:0.75));

d_q = sin(2*pi*146.83*(0:0.00015000:0.3));
d_high = sin(2*pi*293.66*(0:0.00015000:0.3));                 %d_high is in the 4th octave
d_higher = sin(2.15*pi*587.33*(0:0.000125000:0.55));           %d_higher is in the 5th octave

e_q = sin(2*pi*164.81*(0:0.00015000:0.3));
e_q_thr = sin(2*pi*164.81*(0:0.00015000:0.3));                %e_q_thr is E in the 3rd octave played quicker
e_q_fla = sin(2*pi*233.0819*(0:0.00015000:0.3));              %e_q_fla is a E Flat note played in the 3rd octave

f_sharp_q = sin(2*pi*369.9944*(0:0.00015000:0.3));
f_four = sin(2*pi*349.23*(0:0.00015000:0.3));

g_q = sin(2*pi*195.9977*(0:0.00015000:0.3));

space_16 = sin(2*pi*000.00*(0:0.000150:0.25));

line1 = [d_q, e_q, f_sharp_q, a_low_q, a_high, d_q, e_q, f_four, a_low_q, d_higher, space_16];
line2 = [d_q, e_q, f_sharp_q, a_low_q, a_high, d_q, e_q, f_four, a_low_q, d_higher, space_16];
line3 = [d_q, e_q_fla, g_q, a_low_q, a_high, d_high, e_q_thr, g_q, a_low_q, d_higher, space_16];
line4 = [d_q, e_q_fla, g_q, a_low_q, a_high, d_high, e_q_thr, f_four, a_low_q, c_5, b_fla];
song = [line1, line2, line3, line4, line1, line2, line3, line4];                        %this section of the code converts the array of lines into an audio file

sound(song,FS);				                                                        %remove "%" to play the music

audiowrite('ValorantXSignals.wav', song, FS);		                            %generates the audio wave  
[audioIn, FS] = audioread('ValorantXSignals.wav');	                            %audio wave input is read
audioOut = stretchAudio(audioIn,9);			                                            %stretches the audio wave

%Fourier transform of audio signal code
[y, FS] = audioread('ValorantXSignals.wav');	                %reads y, which is set as the audo wave input
Y = fft(y);                                                         %this is the fast fourier transform of y
n = numel(y);                                                            %number of elements
frequency = linspace(-FS/2, FS/2, n+1);		                        %creates frequency vector
frequency(end) = [];
shiftSpectrum = fftshift(Y);	                                         %this centers the spectrum

%Declarating and initializing variables for subplots
f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%Plotting and Labeling the audio signal in time domain code
figure(f1);
subplot(3,1,1);				 %This formats the 3 plots into one window in the first slot
plot(y);					%this line plots the song in time domain
axis([0,74,-1,1]);			 %the following sets x and y axes of the plot
title('Time Domain');				
xlabel('Seconds');				
ylabel('y(t)');	

%Plotting and Labeling the stretched signal in time domain code
figure(f1);				        %configuring subplot window for the original signal
subplot(3,1,2);				     %formats 3 plots into one window in the second slot
t = (0:size(audioOut,1)-1)/FS; 		%the time vector created to plot the stretch audio output
plot(t, audioOut);              %plot the stretched audio output in time domain
title('Time Domain');			
xlabel('Seconds');			
ylabel('y(t)');				

%Plotting and Labeling the magnitude in the frequency domain code
figure(f1);
subplot(3,1,3);				            %formats 3 plots into one window in the third slot
plot(frequency,abs(shiftSpectrum));		 %this line plots the song in frequency domain
axis([-500,500,0,22000]);		        %the following sets x and y axes of the plot
title('Frequency Domain');
xlabel ('Hz');
ylabel('Y(jw)');

%Plotting and Labeling the spectrogram code of the music created
figure;
window=hamming(1024);	                                               %signal is divided into 1024 segments
noverlap=512;			                                             %setting the number of overlap samples in the window
nfft=2048;			                                                  %generating frequency resolution from comparing different signals
[S,F,T,P]=spectrogram(y,window,noverlap,nfft,FS,'yaxis');	         %spectrogram plot	
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;view(0,90);        %surface plot
colormap(hot);
colorbar;
set(gca,'clim',[-95 0]);						%setting color bar
title('Spectrogram');
xlabel('Seconds')
ylabel('kHz');

%EXTRA CREDIT: Adding White Gaussian Noise (WGN) to music
Gaussian = awgn(song, 20);                                  %adds WGN to song with a signal-to-noise ratio of 20
audiowrite('WNoise.wav', Gaussian,FS);

%sound(Gaussian,FS);                                        %remove the "%" symbol to play WGN with code

%EXTRA CREDIT: Plotting WGN in the Time Domain
figure(f2);				                                        %arranging subplot window for WGN
subplot(3,1,1);                                                  %formatting 3 plots into one window in the new first slot
plot(Gaussian);
axis([0,200,-1.75,1.75]);		                                %the following sets x and y axes of the plot                        
title('Time Domain with added White Noise');
xlabel('Seconds');
ylabel('y(t)');

%EXTRA CREDIT: WGN in the Frequency Domain
figure(f2);	
subplot(3,1,2);                                                    %formatting 3 plots into one window in the new second slot
White_Noise_Freq = (0:length(Gaussian)-1)*FS/(length(Gaussian));	%generating frequency vector
White_Noise_Signal = abs(fft(Gaussian));		            	   %shifting the spectrum
plot(White_Noise_Freq,White_Noise_Signal);			
title('Frequency Domain with added White Noise');
xlabel('Hz');
ylabel('Y(jw)');

%White Noise for Spectrogram
figure(f2);
subplot(3,1,3);                                                         %formatting 3 plots into one window
window=hamming(512);	                                    	        %signal is divided into 1024 segments
noverlap=256;		                                       		         %setting number of overlap samples in the window
nfft=1024;			                                        	    %generating frequency resolution to compare different signals
[S,F,T,P]=spectrogram(Gaussian,window,noverlap,nfft,FS,'yaxis');	    %spectrogram plot
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;view(0,90);	    %surface plot
colormap(hot);
colorbar;	
set(gca,'clim',[-95 0]);							
title('Spectrogram of Music with Noise');
xlabel('Seconds')
ylabel('kHz');

%Bandpass Filter Code
Filter = bandpass(song,[1, 11000],FS);		                        %filtering the white noise frequency amount that is allowed to pass through
audiowrite('Filter.wav', Filter,FS);

%sound(Filter, FS);                                                 %remove the "%", to play the song with the filter
		
%Filtering Noise in the Time Domain Code
figure(f3);			                                                %formatting the subplot window for filtered WGN
subplot(3,1,1);			
plot(Filter)
axis([0,74,-1.5,1.5]);
title('Time Domain with Filtered Noise')
xlabel ('seconds')
ylabel('y(t)');

%Filter for Noise in the Frequency Domain Code
figure(f3);	
subplot(3,1,2);
FWhite_Noise_Freq = (0:length(Filter)-1)*FS/(length(Filter));	 %creates frequency vector
FWhite_Noise_Signal = abs(fft(Filter));				
plot(FWhite_Noise_Freq,FWhite_Noise_Signal);
title('Frequency Domain and Filtered White Noise');
xlabel('Hz');                                                       %displays the label for the x axis for the freuuency domain
ylabel('Y(jw)');                                                    %displays the label for the y axis for the frequency domain

%Filter of Noise Spectrogram Code
figure(f3);	
subplot(3,1,3);
window=hamming(512);	                                             %signal will be divided in to into 1024 sections
noverlap=256;			                                           %how many of overlaps window
nfft=1024;			                                                    %creates frequency resolution to compare different signals
[S,F,T,P]=spectrogram(Filter,window,noverlap,nfft,FS,'yaxis');		%spectrogram plot
surf(T,F,10*log10(P),'edgecolor','none'); axis tight;view(0,90);	%surface plot
colormap(hot);
colorbar;
set(gca,'clim',[-95 0]);							
title('Spectrogram of Music with Filtered Noise');
xlabel('Seconds')                                                      %displays the label for the x axis for the filter spectrum
ylabel('kHz');                                                         %displays the label for the y axis for the filter spectrum

%Code for Graphs of Filtered and Unfiltered WGN, and the Music Time Domain
figure(f4);
subplot(2,1,1);
plot(Gaussian);
hold on;
plot(song);
hold on;
plot(Filter);
title('White Noise, Filter White Noise, and Music in Time Domain');
legend('White Noise', 'Music', 'Filtered White Noise');
xlabel('Seconds');                                                      %displays the label for the x axis for the time domain
ylabel('y(t)');                                                         %displays the label for the y axis for the time domain

 %Code For Graphs of Filtered and Unfiltered WGN, and Frequency domain
figure(f4);
subplot(2,1,2);
plot(White_Noise_Freq,White_Noise_Signal);
hold on;
plot(frequency, abs(shiftSpectrum));
hold on;
plot(FWhite_Noise_Freq,FWhite_Noise_Signal);
title('White Noise, Filter White Noise, and Music in Frequency Domain ');  %title of graph
legend('White Noise', 'Music', 'Filtered White Noise');
xlabel('Hz');                                                               %displays the label for the x axis for the frequency domain
ylabel('Y(jw)');                                                            %displays the label for the yaxis for the frequency domain

