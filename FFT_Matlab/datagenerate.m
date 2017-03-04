function data_out = datagenerate(data)
       data_out = [];
       for n = 1:4096
             r2 = un2singed16(data(n));
             data_out= [data_out;complex(r2.real,r2.image)];
       end
end