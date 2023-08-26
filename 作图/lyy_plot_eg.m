
clc,clear;

a=rand(20,5);

line.type='-';
line.width=2;
 line.color=[[0 0 139]/255;[0 139 139]/255;[105 105 105]/255];%如果不写，默认为0

boxState.judge="off";
boxState.width=1.5;%坐标盒线宽

markState.judge="off";
markState.symbol=['o','s','d'];
markState.size=7;

coordinate.judge="on";
coordinate.xLabel='xlabel';
coordinate.yLabel='ylabel';
coordinate.range=[[0 25];[0 1]];
coordinate.fontsize=12;

saveState.judge="off";
saveState.name="figure2.tif";
saveState.size=[200,200,950,650];
saveState.resolution='-r600';

legendState.judge="on";
legendState.name=['A','B','C','D','E'];
legendState.fontsize=12;
legendState.locatoin='eastoutside';

lyy_plot(a,coordinate,line,boxState,markState,legendState,saveState);






