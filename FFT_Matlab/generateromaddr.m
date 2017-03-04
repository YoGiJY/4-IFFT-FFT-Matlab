function [Addr0Rom,Addr1Rom,Addr2Rom,Addr3Rom,Addr4Rom] = generateromaddr();

Addr0Rom = [];
Addr1Rom = [];
Addr2Rom = [];
Addr3Rom = [];
Addr4Rom = [];
uint16 jtemp;
SIZE = 4096;
for i = 0:1:SIZE-1
    itemp = floor(i / 1024);
    jtemp = mod(i,4);
    ktemp =  hex2dec('0fff');
    temp = bitand(itemp,ktemp,'uint16');
    temp1 = bitand(jtemp,ktemp,'uint16');
    Addr0Rom(i+1) = temp * 4 + temp1; %4bit
    %{ad_reg2[11:10],ad_reg2[1:0]};
    
    itemp = floor(i / 256);
    temp = bitand(itemp,ktemp,'uint16');
    temp1 = bitand(jtemp,ktemp,'uint16');
    Addr1Rom(i+1) = temp * 4 + temp1;%6bit
    %{ad_reg3[11:8],ad_reg3[1:0]};%6bit
    
    
    itemp = floor(i / 64);
    temp = bitand(itemp,ktemp,'uint16');
    temp1 = bitand(jtemp,ktemp,'uint16');
    % {ad_reg4[11:6],ad_reg4[1:0]};
    Addr2Rom(i+1) = temp * 4 + temp1;  %8bit
    
    itemp = floor(i / 16);
    temp = bitand(itemp,ktemp,'uint16');
    temp1 = bitand(jtemp,ktemp,'uint16');             %{ad_reg5[11:4],ad_reg5[1:0]};
    Addr3Rom(i+1) = temp * 4 + temp1;  %10bit
    
    %ad_reg6;
    Addr4Rom(i+1) =bitand(i,ktemp,'uint16');
end
end