figure;%clf每次計算清除原圖,重新畫圖;figure 每次計算保留作圖
hold on;%保留每個i點,如不保留,圖上只留最後一個點
N=3000;
m=2;%# of each hidden variable 
P=zeros(N,3);%設定矩陣大小
for i = 1:N; 
%    p_abc = trianglewithsymmetry(m);
    p_abc = trianglewithsymmetryforN(m);
    tmp=p_abc(:);%將方陣轉成行矩陣[a b]→a
                 %                      b
                                 
    P(i,:)=tmp([1 4 8])';%P(i,:)第i列矩陣,tmp(1:3)第一列到第三列矩陣元素,再轉置成一列填入P的第i列
%     plot3(p_ab(1,1), p_ab(1,2), p_ab(2,1), '.'); 
%     plot3(tmp(1),tmp(2),tmp(3), '.'); 
%     hold on;
end; 
save(strcat('RawData_N',num2str(N),'_m',num2str(m),'.mat'));

scatter3(P(:,1),P(:,2),P(:,3))
xlabel('p_{abc}(1,1,1)')
ylabel('p_{abc}(1,2,1)')
zlabel('p_{abc}(2,2,2)')
% 
% k = boundary(P);
% %k = convhull(P);
% hold on
% trisurf(k,P(:,1),P(:,2),P(:,3),'Facecolor','red','FaceAlpha',0.1)
