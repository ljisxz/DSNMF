
%........................Figure 1(a)..................
TAC=[];
filenames = dir('*AC_parameteranlysis.csv');
filenames = {filenames.name}';
datasets={};
a=[];
p=[];
color=[];
ac=[];
k=1;
for h=1:length( filenames )
    dataset=split(filenames{h},'_');
    dataset=dataset{1}; 
    datasets{h}=dataset;
    AC=importdata(filenames{h});
    for i=1:size(AC,1)
        for j=1:size(AC,2)
           a=[a;i];
           p=[p;j];
           k=k+1;
           color=[ color;AC(i,j)];
            ac=[ ac;AC(i,j)];
        end
    end
    TAC(:,:,h)=AC;
end
nonzeros = find(TAC);
[px,py,pz] = ind2sub(size(TAC),nonzeros);
s=scatter3(px,py,pz,[],color,'filled');
s.SizeData =10;
colorbar%
xlabel('p');
ylabel('\alpha');
%zlabel('Datasets');
set(gca,'XTick',1:7);
Xlabels={'8','7','6','5','4','3','2'};
set(gca,'XTicklabel',Xlabels);
set(gca,'YTick',1:7);
Ylabels={'0.001','0.01','0.1','1','10','100','1000'};
set(gca,'YTicklabel',Ylabels);
set(gca,'ZTick',1:h);
set(gca,'ZTicklabel',datasets);
set(gca, 'FontSize', 12);

%........................Figure 1(b)..................

TNMI=[];
filenames = dir('*NMI_parameteranlysis.csv');
filenames = {filenames.name}';
datasets={};
a=[];
p=[];
color=[];
ac=[];
k=1;
for h=1:length( filenames )
    dataset=split(filenames{h},'_');
    dataset=dataset{1}; 
    datasets{h}=dataset;
    NMI=importdata(filenames{h});
    for i=1:size(NMI,1)
        for j=1:size(NMI,2)
           a=[a;i];
           p=[p;j];
           k=k+1;
           color=[ color;NMI(i,j)];
            ac=[ ac;NMI(i,j)];
        end
    end
    TNMI(:,:,h)=NMI;
end
nonzeros = find(TNMI);
[px,py,pz] = ind2sub(size(TNMI),nonzeros);
s=scatter3(px,py,pz,[],color,'filled');
s.SizeData =10;
colorbar%
xlabel('p');
ylabel('\alpha');
set(gca,'XTick',1:7);
Xlabels={'8','7','6','5','4','3','2'};
set(gca,'XTicklabel',Xlabels);
set(gca,'YTick',1:7);
Ylabels={'0.001','0.01','0.1','1','10','100','1000'};
set(gca,'YTicklabel',Ylabels);
set(gca,'ZTick',1:h);
set(gca,'ZTicklabel',datasets);
set(gca, 'FontSize', 12);

..................fig2(a).........................
TAC=[];
filenames = dir('*AC_Iter.csv');
filenames = {filenames.name}';
datasets={}; 
k=1:8;
for h=1:length( filenames )
%h=1;
dataset=split(filenames{h},'_');
dataset=dataset{1}; 
datasets{h}=dataset;
AC=importdata(filenames{h});
TAC=[TAC;AC];
end
TAC= TAC'*100;
plot(k,  TAC(:,1),'-h',k,  TAC(:,2),'-s',k,  TAC(:,3),'-o',k,  TAC(:,4),'- x',k,  TAC(:,5),'-+',k,  TAC(:,6),'-*', 'LineWidth',1);
xlabel('Number of Iteration');
xlabels={'10','20','30','40','50','60','70','80'};
set(gca,'xtick',1:1:8) 
set(gca,'XTicklabel',xlabels);
ylabel('ACC(%)');
legend( datasets{1}, datasets{2}, datasets{3}, datasets{4}, datasets{5},datasets{6},  'location','Best');
set(gca, 'FontSize', 12);
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'IterAC.pdf');

%..................fig2(b).........................
TNMI=[];
filenames = dir('*NMI_Iter.csv');
filenames = {filenames.name}';
datasets={}; 

for h=1:length( filenames )
%h=1;
dataset=split(filenames{h},'_');
dataset=dataset{1}; 
datasets{h}=dataset;
NMI=importdata(filenames{h});
TNMI=[TNMI;NMI];
end
k=1:8;
TNMI= TNMI'*100;
plot(k,  TNMI(:,1),'-h',k,  TNMI(:,2),'-s',k,  TNMI(:,3),'-o',k,  TNMI(:,4),'- x',k,  TNMI(:,5),'-+',k,  TNMI(:,6),'-*', 'LineWidth',1);
xlabel('Number of Iteration')
set(gca,'xtick',1:1:8) 
xlabels={'10','20','30','40','50','60','70','80'};
set(gca,'XTicklabel',xlabels);
ylabel('NMI(%)');
legend( datasets{1}, datasets{2}, datasets{3}, datasets{4}, datasets{5}, datasets{6},'location','Best');
set(gca, 'FontSize', 12);
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'IterNMI.pdf');   

%......................fig4(a)...............................
TAC=[];
filenames = dir('*AC_percentage.csv');
filenames = {filenames.name}';
datasets={}; 
k=1:5;
for h=1:length( filenames )
dataset=split(filenames{h},'_');
dataset=dataset{1}; 
datasets{h}=dataset;
AC=importdata(filenames{h});
TAC=[TAC;AC];
end
TAC= TAC'*100;
plot(k,  TAC(:,1),'-h',k,  TAC(:,2),'-s',k,  TAC(:,3),'-o',k,  TAC(:,4),'- x',k,  TAC(:,5),'-+',k,  TAC(:,6),'-r', 'LineWidth',1);
xlabel('Per');
xlabels={'5%','10%','15%','25%','30%'};
set(gca,'xtick',1:1:5) 
set(gca,'XTicklabel',xlabels);
ylabel('ACC(%)');
legend( datasets{1}, datasets{2}, datasets{3}, datasets{4}, datasets{5},  datasets{6}, 'location','Best');
set(gca, 'FontSize', 12);
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'PerAC.pdf');


%......................fig4(b)...............................
TNMI=[];
filenames = dir('*NMI_percentage.csv');
filenames = {filenames.name}';
datasets={}; 

for h=1:length( filenames )
dataset=split(filenames{h},'_');
dataset=dataset{1}; 
datasets{h}=dataset;
NMI=importdata(filenames{h});
TNMI=[TNMI;NMI];
end

TNMI= TNMI'*100;
plot(k,  TNMI(:,1),'-h',k,  TNMI(:,2),'-s',k,  TNMI(:,3),'-o',k,  TNMI(:,4),'- x',k,  TNMI(:,5),'-+',k,  TNMI(:,6),'-r', 'LineWidth',1);
% bar(TAC')
%k,obj(:,1),'-h', k,obj(:,2),'-s',k,obj(:,3),'-o',k,obj(:,4),'- x',k,obj(:,5),'-+',k,obj(:,6),'-*','LineWidth',1,'MarkerSize',10);
xlabel('Per');
set(gca,'xtick',1:1:5) 
xlabels={'5%','10%','15%','25%','30%'};
set(gca,'XTicklabel',xlabels);
ylabel('NMI(%)');
legend( datasets{1}, datasets{2}, datasets{3}, datasets{4}, datasets{5},  datasets{6}, 'location','Best');
set(gca, 'FontSize', 12);
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'PerNMI.pdf');


%...................fig6(a).............................
data = [
    0.69322	0.43583	0.43130	0.30765	0.27513;
    0.71409	0.49704	0.33043	0.26887	0.23235;
    0.57843	0.41148	0.29809	0.27583	0.24383;
    0.13252	0.12765	0.12870	0.12974	0.12870;
    0.59409	0.46330	0.30470	0.26157	0.20800;
    0.56870	0.27304	0.19478	0.18087	0.15652;
    0.53148	0.46052	0.38296	0.30922	0.26330;
    0.72435	0.50357	0.45861	0.38652	0.31200
];
data=data*100;
x = 1:5;
colors = lines(8);
figure;
hold on;
for i = 1:size(data, 1)
    plot(x, data(i,:), '-o', 'Color', colors(i,:), 'LineWidth', 1, ...
         'DisplayName', ['Line ' num2str(i)]);
end
hold off;
box on
xticks(1:5);
xticklabels({'5%', '10%', '15%', '20%', '25%'});
xlabel('Noise Level');
ylabel('ACC(%)');
legend({'CSNMF','GNMFLD','GSNMF','SNMFCC ','PCPSNMF','CAN','HSSNMF','DSNMF'},'Location', 'northeast');
grid on;
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'RobustACC.pdf');

%...................fig6(b).............................
data = [0.75468	0.5439	0.392	0.29372	0.23704
0.74985	0.50141	0.3018	0.21408	0.17566
0.72272	0.52963	0.41128	0.36637	0.29846
0.12679	0.12601	0.11912	0.12414	0.12428
0.67301	0.49811	0.32997	0.2556	0.18341
0.69623	0.35884	0.23027	0.22695	0.1666
0.69286	0.58516	0.49406	0.37692	0.3136
0.79962	0.59207	0.57304	0.53919	0.42697];
data=data*100;
x = 1:5;
colors = lines(8);
figure;
hold on;
for i = 1:size(data, 1)
    plot(x, data(i,:), '-o', 'Color', colors(i,:), 'LineWidth', 1, ...
         'DisplayName', ['Line ' num2str(i)]);
end
hold off;
box on
xticks(1:5);
xticklabels({'5%', '10%', '15%', '20%', '25%'});
xlabel('Noise Level');
ylabel('NMI(%)');
legend({'CSNMF','GNMFLD','GSNMF','SNMFCC ','PCPSNMF','CAN','HSSNMF','DSNMF'},'Location', 'northeast');
grid on;
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'RobustNMI.pdf');

%.....................fig7...........................
obj=[];
filenames = dir('*convergence.csv');
filenames = {filenames.name}';
datasets={};
a=[];
for h=1:length( filenames )
%h=1;
dataset=split(filenames{h},'_');
dataset=dataset{1}; 
datasets{h}=dataset;
ob=importdata(filenames{h});
obj=[obj;ob];
end

obj=obj';
k=1:100;
% plot(k,obj(:,1),'-', k,obj(:,2),'-',k,obj(:,3),'-',k,obj(:,4),'-',k,obj(:,5),'-',k, obj(:,6),'-','LineWidth',1,'MarkerSize',10);
% xlabel('Iteration Number');
% ylabel('Objective Value');
% legend( datasets{1}, datasets{2}, datasets{3}, datasets{4}, datasets{5},datasets{6},'location','Best');
%PIE ............fig7(a)...............
figure(1)
plot(k,obj(:,1),'-', 'LineWidth',1);
xlabel('Number of Iterations');
ylabel('Objective Value');
set(gca, 'FontSize', 12);
ylim([-1*100000000, 12*100000000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'PIE_con.pdf');

%COIL100............fig7(d)...............
figure(2)
plot(k,obj(:,2),'-', 'LineWidth',1);
xlabel('Number of Iterations');
ylabel('Objective Value');
set(gca, 'FontSize', 12);
ylim([-1*1000000, 4*1000000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'COIL100_con.pdf');

%COIL20............fig7(c)...............
figure(3)
plot(k,obj(:,3),'-', 'LineWidth',1);
xlabel('Number of Iterations');
ylabel('Objective Value');
set(gca, 'FontSize', 12);
ylim([-1*10000000, 12*10000000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'COIL20_con.pdf');

%MNIST............fig7(f)...............
figure(4)
plot(k,obj(:,4),'-', 'LineWidth',1);
xlabel('Number of Iterations');
set(gca, 'FontSize', 12);
ylabel('Objective Value');
ylim([-1*10000000, 7*10000000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'MNIST_con.pdf');

% Optdigits............fig7(e)...............
figure(5)
plot(k,obj(:,5),'-', 'LineWidth',1);  
xlabel('Number of Iterations');
ylabel('Objective Value');
set(gca, 'FontSize', 12);
ylim([-1*10000000, 4*10000000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'Optdigits_con.pdf');

%UMIST............fig7(b)...............
figure(6)
plot(k,obj(:,6),'-', 'LineWidth',1); 
xlabel('Number of Iterations');
ylabel('Objective Value');
set(gca, 'FontSize', 12);
ylim([-1*100000, 16*100000])
set(gcf, 'Units', 'Inches');
pos = get(gcf, 'Position');
set(gcf, 'PaperPositionMode', 'Auto', ...
'PaperUnits', 'Inches', ...
'PaperSize', [pos(3), pos(4)]);
print(gcf, '-dpdf', 'UMIST_con.pdf');



