close all;
clear;

data_file = fopen("data2.txt", 'w');

Fs=48e3;
dt = 1/Fs;
t=(0:dt:(2.135e-2)-dt);

amp = 1;
s1 = amp*cos(2*pi*1200*t);
s2 = amp*sin(2*pi*3600*t);
s3 = amp*sin(2*pi*7600*t);
s4 = amp*sin(2*pi*14000*t);
s5 = amp*sin(2*pi*17000*t);
y = s1+s2+s3+s4+s5;
y=y/5;

digital_y = round(((2^23)-1)*y);
data = string(ndec2hex(digital_y, 24));
fprintf(data_file, '%s\n', data);

fclose(data_file);

close all;

f=fft(digital_y);
fv=Fs*(0:1024-1)/1024;
subplot(2,1,1);
plot(t, digital_y)
subplot(2,1,2);
plot(fv, abs(f));

function [hexstring]=ndec2hex(x,n)
% x : input decimal number
% n :   number of bits to perform 2's complements
% hexstring : hex representation of two's complement of x 
x=x + (x<0).*2^n; 
hexstring=dec2hex(x, ceil(n/4));
end 