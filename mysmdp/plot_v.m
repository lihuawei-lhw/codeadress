function plot_v(Y1)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 15-May-2023 19:33:46 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% 创建 plot
plot(Y1,'Marker','*');

% str = [num2str(Y1)];
% X1 = 1:length(Y1);
% text(X1,Y1,cellstr(str));
% 创建 xlabel
xlabel({'Policy'});

% 创建 ylabel
ylabel({'单位期望成本(RMB)'});
