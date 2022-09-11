function [U,V,objFcn] = myfcm(T,m,epsm)
%%%%%%%%%%%%%%%%% FCM Algorithm %%%%%%%%%%%%%%%%%%%
% input:
%       data 输入集n*s
%       c 聚类中心个数
%       T 迭代次数
%       m 模糊系数
%       epsm 收敛精度
% output:
%       U 隶属度矩阵c*n
%       V 聚类中心向量c*s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

if nargin < 3
%     T = 100;
    T = 1000;
end
if nargin < 5
    epsm = 1.0e-6;
end
if nargin < 4
    m = 2;
end

data = importdata('FCM.txt');
% 获取数据大小
[n,s] = size(data);
% 簇个数
c = 3;
% 初始化索引
index = 0;

% 初始化隶属度矩阵
U0 = rand(c,n);
temp = sum(U0,1);
for i = 1:n
    % 保证每个数据对各类的隶属度只和为1
    U0(:,i) = U0(:,i)./temp(i);
end

% 迭代次数
iter = 0;
V(c,s) = 0;
U(c,n) = 0;
% 数据与聚类中心的欧氏距离
distance(c,n) = 0;

while(iter < T)
    iter = iter+1;
    % 计算聚类中心
    Um = U0.^m;
    V = Um*data./(sum(Um,2)*ones(1,s));
    % 更新隶属度矩阵
    for i = 1:c
        for j = 1:n
            distance(i,j) = mydist(data(j,:),V(i,:));
        end
    end
    U = 1./(distance.^m.*(ones(c,1)*sum(distance.^(-m))));
    % 如果U是矩阵，则max(U)是包含每列最大值的行向量 1*150

   

    % 目标函数值
    objFcn(iter) = sum(sum(Um.*distance.^2));
    % 算法停止条件
    if norm(U-U0,Inf) < epsm
        break
    end

%     disp(size(label1));
%     disp(size(label2));
%     disp(size(label3));
    U0 = U;
end
maxU = max(U);
for k = 1:c
    index = U(k,:) == maxU;
    label = data(index,:);
    if k == 1
        label1 = label;
    elseif k == 2
        label2 = label;
    else
        label3 = label;
    end
end
labelsum = [label1;
            label2;
            label3];
disp(size(labelsum));
myplot(U,objFcn);
myscatter(label1,label2,label3);





