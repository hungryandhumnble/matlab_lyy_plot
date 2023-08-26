%2023.8.1
%作图测试

clc,clear;
%% 二维图
a=rand([10,3]);

%生成图片

%设置参数
% clc,clear,close all;
fontSize=12;%字体大小
lineWidth =2;%图像的线宽
lineWidthBox=1.5;%坐标盒线宽
symbol=['o','s','d'];%点的符号
markerSize=7;%符号大小
pictureSize=[200,200,950,650];%图片尺寸 前两个值为图片左下角的坐标，后两个值为长宽
fileName="figure2.tif";%生成图片的文件名
pictureResolution='-r600';%生成图片精度，数字越大，精度越高，图片越大
color=[[0 0 139]/255;[0 139 139]/255;[105 105 105]/255];%不同曲线对应的不同颜色的rgb值
coordinateRange=[[0 50];[0 4]];%横纵坐标范围
xLabel='xlabel';
yLabel='ylabel';

%作图
figure;
hold on;
box on;
set(gca,'LineWidth',lineWidthBox)%设置坐标盒参数
for i=1:3
plot(1:10,a(:,i),'-','Color',color(i,:),'LineWidth',lineWidth,'Marker',symbol(1,i),'MarkerSize',markerSize,'MarkerFaceColor',color(i,:));
%作图，并确定线条颜色、线宽、符号大小与颜色
end
legend('A','B','C','location','eastoutside');%设置图例内容与位置
legend("boxoff");
set(gca,'XLim',coordinateRange(1,:),'YLim',coordinateRange(2,:));%设置坐标范围
xlabel(xLabel);
ylabel(yLabel);%设置横纵坐标下标
title('title');
set(gca,'FontSize',fontSize,'FontName','Times New Roman');%设置横纵坐标下标字体


set(gcf,'Position',pictureSize);

%%output
print('-djpeg',fileName,pictureResolution);

