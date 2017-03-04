function r2 = untosinged(data)
    % 将补码转化为带符号位的数据
    if(data.real>256)
        r2.real = int32(-512 + data.real);
    else
        r2.real = int32(data.real);
    end
    
    if(data.image>256)
        r2.image = int32(-512 + data.image);
    else
        r2.image = int32(data.image);
    end
end