function r2 = untosinged(data)
    % ������ת��Ϊ������λ������
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