function plot_v(Y1)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 15-May-2023 19:33:46 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% ���� plot
plot(Y1,'Marker','*');

% str = [num2str(Y1)];
% X1 = 1:length(Y1);
% text(X1,Y1,cellstr(str));
% ���� xlabel
xlabel({'Policy'});

% ���� ylabel
ylabel({'��λ�����ɱ�(RMB)'});
