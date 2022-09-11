function myplot(U,objFcn)
% 画图函数/隶属度矩阵可视化
figure(1)
subplot(3,1,1);
plot(U(1,:),'-b');
title('隶属度矩阵值')
ylabel('第一类')
subplot(3,1,2);
plot(U(2,:),'-r');
ylabel('第二类')
subplot(3,1,3);
plot(U(3,:),'-g');
xlabel('样本数')
ylabel('第三类')
figure(2)
grid on
plot(objFcn);
title('目标函数变化值');
xlabel('迭代次数')
ylabel('目标函数值')
