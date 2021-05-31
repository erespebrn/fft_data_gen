close all;
clear;

fft_ds_re = fopen("data_out_re.txt",'r');
fft_ds_im = fopen("data_out_im.txt",'r');

fft_re = fscanf(fft_ds_re, '%li');
fft_im = fscanf(fft_ds_im, '%li');

fft = complex(double(fft_re), double(fft_im));

fv=48e3*(0:1024-1)/1024;

mag = abs(fft);

plot(fv, mag)
fclose(fft_ds_re);
fclose(fft_ds_im);
