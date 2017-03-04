function [DataRom,DataRom0,DataRom1,DataRom2,DataRom3,DataRom4] = generaterom()
%% 旋转因子产生
uint16 real;
uint16 imag;
uint16 k;
uint16 A ;
uint16  num;
SIZE = 4096;

% 第一级旋转因子
DataRom = [];
A = 255;
DataRom.real = A;
DataRom.image = 0;

% 第二级旋转因子
%DataRom0[16]

DataRom0 = [];
k = 0;
for i =0:3
    for j = 0:3
        real= round(A*cos(-2 * 256 *i*j*pi / SIZE));
        if real >= 0
            real = bitand(real ,hex2dec('01ff'));                   % 0000_0001_1111_1111
        else
            real = bitand((real + 512) , hex2dec('01ff'));    % 0000_0001_1111_1111
        end
        imag = round(A*sin(-2 * 256 * i*j*pi / SIZE));
        if (imag >= 0)
            imag = bitand(imag ,hex2dec('01ff'));
        else
            imag = bitand((imag + 512) , hex2dec('01ff'));
        end
        DataRom0(k+1).real = real;
        DataRom0(k+1).image = imag;
        k = k + 1;
    end
end

%DataRom1[64]
k = 0;
num =0 ;

for L = 0:3
    for i = 0:3
        num = L + i * 4;
        for j = 0:3
            real = round(A*cos(-2 * 64 * num*j*pi / SIZE));
            if real >= 0
                real = bitand(real ,hex2dec('01ff'));
            else
                real = bitand((real + 512) , hex2dec('01ff'));
            end
            imag = round(A*sin(-2 * 64 * num*j*pi / SIZE));
            if (imag >= 0)
                imag = bitand(imag ,hex2dec('01ff'));
            else
                imag = bitand((imag + 512) , hex2dec('01ff'));
            end
            DataRom1(k+1).real = real;
            DataRom1(k+1).image = imag;
            k = k + 1;
        end
    end
end

%DataRom2[256]
k = 0;
num = 0;
for L1 = 0:3
    for L = 0:3
        for i = 0:3
            num = L1 + (L + i * 4) * 4;
            for j = 0:3
                real = round(A*cos(-2 * 16 * num*j*pi / SIZE));
                if real >= 0
                    real = bitand(real ,hex2dec('01ff'));
                else
                    real = bitand((real + 512) , hex2dec('01ff'));
                end
                imag = round(A*sin(-2 * 16 * num*j*pi / SIZE));
                if (imag >= 0)
                    imag = bitand(imag ,hex2dec('01ff'));
                else
                    imag = bitand((imag + 512) , hex2dec('01ff'));
                end
                DataRom2(k+1).real = real;
                DataRom2(k+1).image = imag;
                k = k + 1;
            end
        end
    end
end

%DataRom3[1024]
DataRom3 = [];
k = 0;
num = 0;

for L2 = 0:3
    for L1 = 0:3
        for L = 0:3
            for i = 0:3
                num = L2 + (L1 + (L + i * 4) * 4)*4;
                for j = 0:3
                    real = round(A*cos(-2 * 4 * num*j*pi / SIZE));
                    if real >= 0
                        real = bitand(real ,hex2dec('01ff'));
                    else
                        real = bitand((real + 512) , hex2dec('01ff'));
                    end
                    imag = round(A*sin(-2 * 4 * num*j*pi / SIZE));
                    if (imag >= 0)
                        imag = bitand(imag ,hex2dec('01ff'));
                    else
                        imag = bitand((imag + 512) , hex2dec('01ff'));
                    end
                    DataRom3(k+1).real = real;
                    DataRom3(k+1).image = imag;
                    k = k + 1;
                end
            end
        end
    end
end

%DataRom4[4096]
k = 0;
num = 0;
DataRom4 = [];
for L3 = 0:3
    for L2 = 0:3
        for L1 = 0:3
            for L = 0:3
                for i = 0:3
                    num =L3 + (L2 + (L1 + (L + i * 4 ) * 4) * 4)*4;
                    for j = 0:3
                        real = round(A*cos(-2 *  num*j*pi / SIZE));
                        if real >= 0
                            real = bitand(real ,hex2dec('01ff'));
                        else
                            real = bitand((real + 512) , hex2dec('01ff'));
                        end
                        imag = round(A*sin(-2 * num*j*pi / SIZE));
                        if (imag >= 0)
                            imag = bitand(imag ,hex2dec('01ff'));
                        else
                            imag = bitand((imag + 512) , hex2dec('01ff'));
                        end
                        DataRom4(k+1).real = real;
                        DataRom4(k+1).image = imag;
                        k = k + 1;
                    end
                end
            end
        end
    end
end
end