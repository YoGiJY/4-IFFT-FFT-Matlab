function r2 = singedtoun(data)
% 这里需要处理的是2^26,就是25bit的补码来表示，而不是使用32bit的补码来表示
      data_in = double(data);
       if(data_in>=0)
           r2 = data_in;
       else
           r2 = 2^25+data_in;
       end
       r2 = uint32(r2);
end