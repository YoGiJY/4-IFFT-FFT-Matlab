function r2 = singedtoun(data)
% ������Ҫ�������2^26,����25bit�Ĳ�������ʾ��������ʹ��32bit�Ĳ�������ʾ
      data_in = double(data);
       if(data_in>=0)
           r2 = data_in;
       else
           r2 = 2^25+data_in;
       end
       r2 = uint32(r2);
end