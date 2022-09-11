% Hierarchical clustering algorithm
% Created by Qian
% Time:2022/08/18

DataPoints = [100 100;
               90  90;
               10  10;
               10  20;
               90  70;
               50  50];

% % pdist：Calculate Euclidean distance
% DiatanceCalc = pdist(DataPoints);
% % squareform：generate diagonal matrix
% Distancematrix = squareform(DiatanceCalc);
% % linkage：Calculate the focus
% GroupsMatrix = linkage(DiatanceCalc);
% % cophenet：Measure the quality of clustering results
% VerifyDistance = cophenet(GroupsMatrix, DiatanceCalc);

% pdist：Calculate distance matrix
DiatanceCalc = pdist(DataPoints,'cosine');
% linkage：Calculate the focus
GroupsMatrix = linkage(DiatanceCalc,'weighted');
% cophenet：Measure the quality of clustering results
VerifyDistance = cophenet(GroupsMatrix, DiatanceCalc);

figure(1)
dendrogram(GroupsMatrix);
title('Hierarchical clustering tree');

disp(VerifyDistance);

