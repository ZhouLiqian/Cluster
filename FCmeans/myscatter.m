function myscatter(label1,label2,label3)
% 将最终聚类结果散点图表示
figure(3)
subplot(1,2,1)
scatter(label1(:,1),label1(:,2),'b');
hold on
scatter(label2(:,1),label2(:,2),'r');
hold on
scatter(label3(:,1),label3(:,2),'g');
hold on
xlabel('特征一');
ylabel('特征二');
title('特征一二聚类结果图');
subplot(1,2,2)
scatter(label1(:,3),label1(:,4),'b');
hold on
scatter(label2(:,3),label2(:,4),'r');
hold on
scatter(label3(:,3),label3(:,4),'g');
hold on
xlabel('特征三');
ylabel('特征四');
title('特征三四聚类结果图');