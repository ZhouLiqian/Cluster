% Kmeans clustering algorithm
% Created by Qian
% Time:2022/08/22

readtext = importdata('testSet.txt');
data = readtext(:,1:2);
figure(1)
gscatter(data(:,1), data(:,2));
title('original dataset');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% K均值聚类 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng(1);
[Idcluster,Idcentor] = kmeans(data,4);
%%%%%%%%%%%%%%%%%%%%% generate optimal parameters K %%%%%%%%%%%%%%%%%%%%%%%
% EvaluateK = evalclusters(data,'kmeans','CalinskiHarabasz','kList',[1:6]);
% disp(EvaluateK);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% K中心点聚类 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat = data;
[IdCluster,Kmedoid,SumDist,Dist,IdClKm,info] = kmedoids(dat,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 高斯混合模型聚类 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
da = dat;
GMModel = fitgmdist(da,4);
idcluster = cluster(GMModel,da);
CenterCluster = GMModel.mu;
sigma = GMModel.Sigma;
DistObj = gmdistribution(CenterCluster,sigma);

figure(2)
subplot(2,2,1)
gscatter(data(:,1), data(:,2),Idcluster,"bgrm","x*o^");
hold on
scatter(Idcentor(:,1),Idcentor(:,2),'x','MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
title('kmeans cluster');
subplot(2,2,2)
gscatter(dat(:,1), dat(:,2),Idcluster,"bgrm","x*o^");
hold on
scatter(Kmedoid(:,1),Kmedoid(:,2),'x','MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
title('center cluster');
subplot(2,2,3)
gscatter(da(:,1), da(:,2),idcluster,"bgrm","x*o^");
hold on
scatter(CenterCluster(:,1),CenterCluster(:,2),'x','MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
fcontour(@(x,y) pdf(GMModel,[x,y]));
title('EM algorithm');
subplot(2,2,4)
fsurf(@(x,y) pdf(DistObj,[x y]));
title('3D picture');



