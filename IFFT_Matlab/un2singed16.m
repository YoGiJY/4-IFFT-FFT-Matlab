function r2 = un2singed16(data)
    % 将补码转化为带符号位的数据
    temp= double(data.real);
    if(temp>32768)
        real = -65536 + temp;
    else
        real = temp;
    end
    
    temp= double(data.image);
    if(temp>32768)
        image = -65536 + temp;
    else
        image = temp;
    end
     r2.real = int32(real);
     r2.image = int32(image);
end