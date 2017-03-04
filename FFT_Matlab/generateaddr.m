function  [addr0,addr1,addr2,addr3,addr4,addr5,addr6] = generateaddr()
%% 数据地址产生
SIZE = 4096;
for i = 0:1:SIZE-1
    ktemp = hex2dec('0fff');                                                          % 0000_1111_1111_1111
    itemp =floor(i / 4) + mod(i,4)* 1024 ;
    addr0(i+1) = bitand( itemp, ktemp,'uint16');
    %{addr0[1:0],addr0[11:2]};
    %cout << i<<":"<<addr0[i] << endl;
    
    temp = bitand(i, hex2dec('0c00'),'uint16');                          % addr1[11:10],0000_1100_0000_0000_0000
    temp1 =bitand( i, hex2dec('03ff'),'uint16');                          % addr1[9:0],    0000_0011_1111_1111_1111
    itemp = temp + floor(temp1 / 4) +mod(temp1,4) * 256;
    addr1(i+1)=bitand( itemp, ktemp,'uint16');
    %{addr1[11:10],addr1[1:0],addr1[9:2]};
    %cout << i<<":"<<addr0[i] << endl;
    
    temp = bitand(i , hex2dec('0f00'),'uint16');                          % 0000_1111_0000_0000
    temp1 =bitand(i,hex2dec('00ff'),'uint16');                            % 0000_0000_1111_1111
    itemp = temp + floor(temp1 / 4) + mod(temp1,4) * 64;
    addr2(i+1) = bitand( itemp, ktemp,'uint16');
    %{addr2[11:8],addr2[1:0],addr2[7:2]};
    %cout << i<<":"<<addr2[i] << endl;
    
    temp = bitand(i , hex2dec('0fc0'),'uint16');                           %0000_1111_1100_0000
    temp1 =bitand(i , hex2dec('003f'),'uint16');
    itemp = temp + floor(temp1 / 4) +mod(temp1, 4) * 16;
    addr3(i+1) = bitand( itemp, ktemp,'uint16');
    %{{addr3[11:6],addr3[1:0],addr3[5:2]};
    
    temp = bitand(i , hex2dec('0ff0'),'uint16');
    temp1 = bitand(i , hex2dec('000f'),'uint16');
    itemp = temp + floor(temp1 / 4 )+mod(temp1, 4) * 4;
    addr4(i+1) = bitand( itemp, ktemp,'uint16');
    %{addr4[11:4], addr4[1:0], addr4[3:2]};
    %assign out_addr4= addr4;
    
    addr5(i+1) = bitand( i, ktemp,'uint16');
    
    temp = mod(i, 4);          %[1:0]
    temp1 = mod(floor(i / 4),4);   %[3:2]
    temp2 = mod(floor(i / 16),4);  %[5:4]
    temp3 = mod(floor(i / 64), 4);  %[7:6]
    temp4 = mod(floor(i / 256),4); %[9:8]
    temp5 = mod(floor(i / 1024),4);%[11:10]
    itemp = temp * 1024 + temp1 * 256 + temp2 * 64 + temp3 * 16 + temp4 * 4 + temp5;
    addr6(i+1) = bitand( itemp, ktemp,'uint16');
end
end