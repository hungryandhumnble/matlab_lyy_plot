%2023.8.13
%作图函数接口

% line.type='-';%线型字符串有:'-'为实线，'--'为虚线，':'为点线，'-.'为点虚线，及'none'表示不用线型
% line.width=2;
%  line.color=[[0 0 139]/255;[0 139 139]/255;[105 105 105]/255];%https://tool.oschina.net/commons?type=3
% 
% boxState.judge="off";
% boxState.width=1.5;%坐标盒线宽
% 
% markState.judge="on";
% markState.symbol=['o','s','d'];%标记图形有'+'，'o'，'*'，和'x'，填入's'代表正方形，'d'代表菱形，'A'为上三角形，'V'为下三角形，'>'为右三角形，'<'为左三角形，'p'为五角星形，'h'为六角星形，none为不用标记。
% markState.size=7;
% 
% coordinate.judge="off";
% coordinate.xLabel='xlabel';
% coordinate.yLabel='ylabel';
% coordinate.range=[[0 50];[0 4]];
% coordinate.fontsize=12;
% 
% saveState.judge="off";
% saveState.name="figure2.tif";
% saveState.size=[200,200,950,650];
% saveState.resolution='-r600';
% 
% legendState.judge="off";
% legendState.name=['A','B','C'];
% legendState.fontsize=12;
% legendState.locatoin='eastoutside';
% 
% lyy_plot(data,coordinate,line,boxState,markState,legendState,saveState);





function result=lyy_plot(data,coordinate,line,boxState,markState,legendState,saveState)

if nargin==7
    

[raw,col]=size(data);
figure;
hold on;
if boxState.judge=="on"
    box on;
    set(gca,'LineWidth',boxState.width);
else
    clear boxState;
end

[x,y]=size(line.color);

if markState.judge=="on"
    if length(markState.symbol)==col
        if x==col&&y==3
for i=1:col
plot(data(:,i),line.type,'Color',line.color(i,:),'LineWidth',line.width,'Marker',markState.symbol(1,i),'MarkerSize',markState.size,'MarkerFaceColor',line.color(i,:));
end
        else
            for i=1:col
            plot(data(:,i),line.type,'LineWidth',line.width,'Marker',markState.symbol(1,i),'MarkerSize',markState.size);
            end
            fprintf("颜色输入未指定");
        end
    else
        error("符号输入错误");
    end

else
     if x==col&&y==3
for i=1:col
plot(data(:,i),line.type,'Color',line.color(i,:),'LineWidth',line.width);
end

     else
         for i=1:col
            plot(data(:,i),line.type,'LineWidth',line.width);
         end
            fprintf("颜色输入未指定");
        end
end

if legendState.judge=="on"
    legend(legendState.name(:),'location',legendState.locatoin);
end
    
if coordinate.judge=="on"
    if numel(coordinate.range)~=4||length(coordinate.range)~=2||coordinate.range(3)<coordinate.range(1)||coordinate.range(4)<coordinate.range(2)
        error("坐标范围输入有误");
    end
    set(gca,'XLim',coordinate.range(1,:),'YLim',coordinate.range(2,:));
    xlabel(coordinate.xLabel);
ylabel(coordinate.yLabel);%设置横纵坐标下标
title('title');
set(gca,'FontSize',coordinate.fontsize,'FontName','Times New Roman');
end

if saveState.judge=="on"
    if length(saveState.size)~=4||saveState.size(3)<saveState.size(1)||saveState.size(3)<saveState.size(2)||saveState.size(4)<saveState.size(1)||saveState.size(4)<saveState.size(2)
    error("保存图片大小输入有误");
    end
        set(gcf,'Position',saveState.size);
print('-djpeg',saveState.name,saveState.resolution);
end




else
    error("输入参数不足");
end