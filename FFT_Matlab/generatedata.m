function data_out = generatedata(data_in)
       data_out = [];
       data_real = uint16(real(data_in));
       data_image = uint16(imag(data_in));
       data = [data_real,data_image];
       for n = 1:4096
             temp.real  = uint16(data(n,1));
             temp.image = uint16(data(n,2));
             data_out = [data_out,temp];
       end
end