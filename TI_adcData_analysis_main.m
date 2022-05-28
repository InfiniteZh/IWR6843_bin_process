close all;
clear all;
file_path = 'data_1_10.5.bin';
numFramesRead = 50;
number_of_Channels = 4;
samplesPerChirp = 256*2;
chirpsPerFrame = 128;
fid = fopen(file_path, 'rb');
%%%%%%%%%%% Read the Binary Data File %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
readBufferSize = numFramesRead*number_of_Channels*samplesPerChirp*chirpsPerFrame;
%print(readBufferSize)
CollectBuffer = fread(fid,readBufferSize, 'int16',0,'l') ;

radar_data = reshape(CollectBuffer, [4, length(CollectBuffer)/4]);
radar_data_I_Channel = reshape(radar_data(1:2,:), [], 1);
radar_data_Q_Channel = reshape(radar_data(3:4,:), [], 1);

% radar_data = reshape(CollectBuffer, samplesPerChirp, number_of_Channels, chirpsPerFrame, numFramesRead); % DPIF_RADARCUBE_FORMAT_1
% % |cmplx16ImRe_t x[numTXPatterns][numDopplerChirps][numRX][numRangeBins] |1D Range FFT output
% % |cmplx16ImRe_t = x[numTXPatterns][numDopplerChirps][numRX][numRangeBins] |1D Range FFT output
% %%%%%%%%%%% Re-Format the DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% radar_data_I_Channel = radar_data(2:2:samplesPerChirp, :, :, :); 
% radar_data_Q_Channel = radar_data(1:2:samplesPerChirp, :, :, :); 
radar_data = radar_data_I_Channel + sqrt(-1)*radar_data_Q_Channel; 
radar_data = reshape(radar_data, samplesPerChirp/2, number_of_Channels, chirpsPerFrame, numFramesRead); % DPIF_RADARCUBE_FORMAT_1
radar_data_cube = permute(radar_data,[1 3 2 4]);
%%%%%%%%%%% Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1),mesh(abs(radar_data_cube(:,:,1,1)));%1DFFT data
figure(1),mesh(real(radar_data_cube(:,:,1,1)));%ADC RAW
legend('Real');
figure(2),mesh(imag(radar_data_cube(:,:,1,1)));
legend('imag');
%plot(imag(radar_data_cube(:,:,1,1)),'b');

figure(3),plot(real(radar_data_cube(:,1,1,1)));
hold on,plot(imag(radar_data_cube(:,1,1,1)));
