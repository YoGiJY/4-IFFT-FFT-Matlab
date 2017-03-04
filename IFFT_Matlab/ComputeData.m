%% 蝶形计算
function [x5,x6,x7,x8] = ComputeData(x1,x2,x3,x4,r1,r2,r3,r4)

% 无符号16bit的数据转化成有符号数据
%
x1r =un2singed16(x1);              % 将16bit数，转化成有符号数据
x2r =un2singed16(x2);
x3r =un2singed16(x3);
x4r =un2singed16(x4);

r1n = untosinged(r1);               % 将9bit数，转化成有符号数据
r2n = untosinged(r2);
r3n = untosinged(r3);
r4n = untosinged(r4);

brw1pr = int32(x2r.real*r2n.real);     biw1pi =int32(x2r.image*r2n.image);
crw2pr = int32(x3r.real*r3n.real);      ciw2pi = int32(x3r.image*r3n.image);
drw3pr = int32(x4r.real*r4n.real);     diw3pi = int32(x4r.image*r4n.image);
brw1pi = int32(x2r.real*r2n.image); biw1pr =int32(x2r.image*r2n.real);
crw2pi = int32(x3r.real*r3n.image); ciw2pr = int32(x3r.image*r3n.real);
drw3pi =int32(x4r.real*r4n.image); diw3pr = int32(x4r.image*r4n.real);

mer = int32(x1r.real * 256 + brw1pr-biw1pi+crw2pr-ciw2pi+drw3pr-diw3pi);
mei = int32(x1r.image * 256 + brw1pi+biw1pr+crw2pi+ciw2pr+drw3pi+diw3pr);
mfr =  int32(x1r.real  * 256 +brw1pi+biw1pr-crw2pr+ciw2pi-drw3pi-diw3pr);
mfi =  int32(x1r.image * 256 - brw1pr+biw1pi-crw2pi-ciw2pr+drw3pr-diw3pi);
mgr = int32(x1r.real * 256 - brw1pr+biw1pi+crw2pr-ciw2pi-drw3pr+diw3pi);
mgi = int32(x1r.image * 256 - brw1pi-biw1pr+crw2pi+ciw2pr-drw3pi-diw3pr);
mhr = int32(x1r.real  * 256 - brw1pi-biw1pr-crw2pr+ciw2pi+drw3pi+diw3pr);
mhi = int32(x1r.image * 256 + brw1pr-biw1pi-crw2pi-ciw2pr-drw3pr+diw3pi);

temp2 = uint32(singedtoun(mer));
temp =uint32(floor(temp2 / 256));
temp1 = uint32(mod(temp , 2));
temp = uint32(floor(temp2 /512));
er = uint16(temp);
if  temp1 == 1
    er = er + 1;
end
er = bitand(er , hex2dec('0000ffff'));

% 	er = temp2 & 7fff;
temp2 = uint32(singedtoun(mei));
temp = uint32(floor(mei / 256));
temp1 = uint32(mod(temp , 2));
temp = uint32(floor(temp2 /512));
ei = uint16(temp);
if temp1 == 1
    ei = ei + 1;
end
ei = bitand(ei , hex2dec('0000ffff'));
%	ei = temp2 & 7fff;

temp2 = uint32(singedtoun(mfr));
temp =uint32(floor(temp2 / 256));
temp1 = mod(temp , 2);
% 这里我们只需要25bit
temp2 = bitand(temp2,hex2dec('01ffffff'));
temp = floor(temp2 /512);
fr = uint16(temp);
if temp1 == 1
    fr = fr + 1;
end
fr = bitand(fr,hex2dec('0000ffff'));
% 	fr = temp2 & 7fff;

temp2 = singedtoun(mfi);
temp = floor(temp2 / 256);
temp1 = mod(temp , 2);
temp = floor(temp2 /512);
fi = uint16(temp);
if temp1 == 1
    fi = fi + 1;
end
fi = bitand(fi , hex2dec('0000ffff'));
% 	fi = temp2 & 7fff;
temp2 = singedtoun(mgr);
temp = floor(temp2 / 256);
temp1 = mod(temp , 2);
temp = floor(temp2 /512);
gr = uint16(temp);
if temp1 == 1
    gr = gr + 1;
end
gr = bitand(gr , hex2dec('0000ffff'));
% 	gr = temp2;

temp2 = singedtoun(mgi);
temp = floor(temp2 / 256);
temp1 = mod(temp , 2);
temp = floor(temp2 /512);
gi = uint16(temp);
if temp1 == 1
    gi = gi + 1;
end
gi = bitand(gi , hex2dec('0000ffff'));
% 	gi = temp2 & 7fff;

temp2 = singedtoun(mhr);
temp = floor(temp2 / 256);
temp1 = mod(temp , 2);
temp = floor(temp2 /512);
hr = uint16(temp);
if temp1 == 1
    hr = hr + 1;
end
hr = bitand(hr , hex2dec('0000ffff'));
%	hr = temp2 & 7fff;

temp2 = singedtoun(mhi);
temp = floor(temp2 / 256);
temp1 = mod(temp , 2);
temp = floor(temp2 /512);
hi = uint16(temp);
if temp1 == 1
    hi = hi + 1;
end
hi = bitand(hi , hex2dec('0000ffff'));
% 	hi = temp2 & 7fff;
% 与FFT的差距之一 [10/25/2016 Yao]
x5.real = er;
x5.image = ei;

x8.real = fr;
x8.image = fi;

x7.real = gr;
x7.image = gi;

x6.real = hr;
x6.image = hi;

end