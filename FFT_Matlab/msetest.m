clear all;

%% 
a = [1:4096]';
b = zeros(4096,1);
data_fft = complex(a,b)/32; % 这里使用Q10.5
data_in  = complex(a,b);
%% 
data_fft_out = fft(data_fft)/64;
data_out = double(matlab_fft(data_in))/32;
%%

% figure(1);
% hist(data_out);
% figure(1);
% hist(data_fft_out);

out_real = (real(data_fft_out)-real(data_out)).^2;
out_image = (imag(data_fft_out)-imag(data_out)).^2;
out = (out_real + out_image)/4096;