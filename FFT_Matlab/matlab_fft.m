function data_out = matlab_fft(data_in)

% %%%%%%%%%%%%%%%%%%%%%%%
% data_in 输入的数据复数形式
% 使用方法：
% data_in = complex(ones(4096,1),zeros(4096,1));  complex 4096x1
% data_out = matlab_fft(data);   complex 4096x1
%%%%%%%%%%%%%%%%%%%%%%%%

global SIZE;
global pi;
pi = 3.141592654;
SIZE = 4096;
%% 数据处理模块

Idata = generatedata(data_in);

%%
uint16 addr0=[];  %
uint16 addr1=[];  %
uint16 addr2=[];  %
uint16 addr3=[];  %
uint16 addr4=[];  %
uint16 addr5=[];  %
uint16 addr6=[];  %

uint16 i;
uint16 itemp;
uint16 ktemp;
uint16 temp;
uint16 temp1;
uint16 temp2;
uint16 temp3;
uint16 temp4;
uint16 temp5;

%% 数据地址产生
addr0_exist = exist('./data/addr0.mat');
if addr0_exist == 1
    load('addr1.mat');
    load('addr2.mat');
    load('addr3.mat');
    load('addr4.mat');
    load('addr5.mat');
    load('addr6.mat');
else
    [addr0,addr1,addr2,addr3,addr4,addr5,addr6] = generateaddr();
    save ./data/addr1.mat addr1;
    save ./data/addr2.mat addr2;
    save ./data/addr3.mat addr3;
    save ./data/addr4.mat addr4;
    save ./data/addr5.mat addr5;
    save ./data/addr6.mat addr6;
end

% 为了提高计算速度，我这里将计算数据保存读入，提高速度

%% 旋转因子产生
rom_exist = exist('./data/DataRom.mat');
if rom_exist==1
    load('./data/DataRom.mat');
    load('./data/DataRom0.mat');
    load('./data/DataRom1.mat');
    load('./data/DataRom2.mat');
    load('./data/DataRom3.mat');
    load('./data/DataRom4.mat');
else
    [DataRom,DataRom0,DataRom1,DataRom2,DataRom3,DataRom4] = generaterom();
    save ./data/DataRom.mat DataRom;
    save ./data/DataRom0.mat DataRom0;
    save ./data/DataRom1.mat DataRom1;
    save ./data/DataRom2.mat DataRom2;
    save ./data/DataRom3.mat DataRom3;
    save ./data/DataRom4.mat DataRom4;
end


%% 旋转因子地址产生
romaddr_exist = exist('./data/Addr0Rom.mat');
if romaddr_exist == 1
    load('./data/Addr0Rom.mat');
    load('./data/Addr1Rom.mat');
    load('./data/Addr2Rom.mat');
    load('./data/Addr3Rom.mat');
    load('./data/Addr4Rom.mat');
else
    [Addr0Rom,Addr1Rom,Addr2Rom,Addr3Rom,Addr4Rom] = generateromaddr();
    save ./data/Addr0Rom.mat Addr0Rom;
    save ./data/Addr1Rom.mat Addr1Rom;
    save ./data/Addr2Rom.mat Addr2Rom;
    save ./data/Addr3Rom.mat Addr3Rom;
    save ./data/Addr4Rom.mat Addr4Rom;
end



%% 蝶形计算
for  i = 0:4:SIZE-1
    x1 = Idata(addr0(i+1)+1);
    x2 = Idata(addr0(i + 2)+1);
    x3 = Idata(addr0(i + 3)+1);
    x4 = Idata(addr0(i + 4)+1);
    
    r1 = DataRom;
    r2 = DataRom;
    r3 = DataRom;
    r4 = DataRom;
    
    [x5,x6,x7,x8] = ComputeData(x1, x2, x3, x4, r1, r2, r3, r4);
    Idata(addr0(i+1)+1) = x5;
    Idata(addr0(i + 2)+1) = x6;
    Idata(addr0(i + 3)+1) = x7;
    Idata(addr0(i + 4)+1) = x8;
end


for  i = 0:4:SIZE-1
    x1 = Idata(addr1(i+1)+1);
    x2 = Idata(addr1(i + 2)+1);
    x3 = Idata(addr1(i + 3)+1);
    x4 = Idata(addr1(i + 4)+1);
    
    r1 = DataRom0(Addr0Rom(i+1)+1);
    r2 = DataRom0(Addr0Rom(i + 2)+1);
    r3 = DataRom0(Addr0Rom(i + 3)+1);
    r4 = DataRom0(Addr0Rom(i + 4)+1);
    
    [x5,x6,x7,x8] = ComputeData(x1, x2, x3, x4, r1, r2, r3, r4);
    Idata(addr1(i+1)+1) = x5;
    Idata(addr1(i + 2)+1) = x6;
    Idata(addr1(i + 3)+1) = x7;
    Idata(addr1(i + 4)+1) = x8;
end


for i = 0: 4:SIZE-1
    x1 = Idata(addr2(i+1)+1);
    x2 = Idata(addr2(i + 2)+1);
    x3 = Idata(addr2(i + 3)+1);
    x4 = Idata(addr2(i + 4)+1);
    
    r1 = DataRom1(Addr1Rom(i+1)+1);
    r2 = DataRom1(Addr1Rom(i + 2)+1);
    r3 = DataRom1(Addr1Rom(i + 3)+1);
    r4 = DataRom1(Addr1Rom(i + 4)+1);
    
    [x5,x6,x7,x8] = ComputeData(x1, x2, x3, x4, r1, r2, r3, r4);
    Idata(addr2(i+1)+1) = x5;
    Idata(addr2(i + 2)+1) = x6;
    Idata(addr2(i + 3)+1) = x7;
    Idata(addr2(i + 4)+1) = x8;
end


for  i = 0:4: SIZE-1
    x1 = Idata(addr3(i+1)+1);
    x2 = Idata(addr3(i + 2)+1);
    x3 = Idata(addr3(i + 3)+1);
    x4 = Idata(addr3(i + 4)+1);
    
    r1 = DataRom2(Addr2Rom(i+1)+1);
    r2 = DataRom2(Addr2Rom(i + 2)+1);
    r3 = DataRom2(Addr2Rom(i + 3)+1);
    r4 = DataRom2(Addr2Rom(i + 4)+1);
    
    [x5,x6,x7,x8] = ComputeData(x1,x2, x3, x4, r1, r2, r3, r4);
    Idata(addr3(i+1)+1) = x5;
    Idata(addr3(i + 2)+1) = x6;
    Idata(addr3(i + 3)+1) = x7;
    Idata(addr3(i + 4)+1) = x8;
end


for  i = 0:4:SIZE-1
    x1 = Idata(addr4(i + 1)+1);
    x2 = Idata(addr4(i + 2)+1);
    x3 = Idata(addr4(i + 3)+1);
    x4 = Idata(addr4(i + 4)+1);
    
    r1 = DataRom3(Addr3Rom(i + 1)+1);
    r2 = DataRom3(Addr3Rom(i + 2)+1);
    r3 = DataRom3(Addr3Rom(i + 3)+1);
    r4 = DataRom3(Addr3Rom(i + 4)+1);
    
    [x5,x6,x7,x8] = ComputeData(x1,x2, x3, x4, r1, r2, r3, r4);
    Idata(addr4(i + 1)+1) = x5;
    Idata(addr4(i + 2)+1) = x6;
    Idata(addr4(i + 3)+1) = x7;
    Idata(addr4(i + 4)+1) = x8;
end


for i = 0:4:SIZE-1
    x1 = Idata(addr5(i + 1)+1);
    x2 = Idata(addr5(i + 2)+1);
    x3 = Idata(addr5(i + 3)+1);
    x4 = Idata(addr5(i + 4)+1);
    
    r1 = DataRom4(Addr4Rom(i + 1)+1);
    r2 = DataRom4(Addr4Rom(i + 2)+1);
    r3 = DataRom4(Addr4Rom(i + 3)+1);
    r4 = DataRom4(Addr4Rom(i + 4)+1);
    
    [x5,x6,x7,x8] = ComputeData(x1,x2, x3, x4, r1, r2, r3, r4);
    Idata(addr5(i + 1)+1) = x5;
    Idata(addr5(i + 2)+1) = x6;
    Idata(addr5(i + 3)+1) = x7;
    Idata(addr5(i + 4)+1) = x8;
end


for i = 0: 4:SIZE-1
    Odata(i + 1) = Idata(addr6(i + 1)+1);
    Odata(i + 2) = Idata(addr6(i + 2)+1);
    Odata(i + 3) = Idata(addr6(i + 3)+1);
    Odata(i + 4) = Idata(addr6(i + 4)+1);
end

%% 将数据
data_out = datagenerate(Odata);
end



