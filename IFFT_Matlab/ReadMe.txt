/*******************************************************/
 @Author:Yao
 @Email:yao.jiang@tongji.edu.cn
 @Time:2016年10月28日11:25:28
 @Brief:Read Me
/******************************************************/
function matlab_ifft.m
其中generatedata.m 是将一个4096*2的矩阵，转化成为一个结构体一列表示一个
如：1  2 .....4096   第一列data(1).real = 1 data(1).image = 3
    3  3       3     第二列data(2).real = 2 data(2).image = 3

其他函数为内部功能函数
