figure;%clf�C���p��M�����,���s�e��;figure �C���p��O�d�@��
hold on;%�O�d�C��i�I,�p���O�d,�ϤW�u�d�̫�@���I
N=3000;
m=2;%# of each hidden variable 
P=zeros(N,3);%�]�w�x�}�j�p
for i = 1:N; 
%    p_abc = trianglewithsymmetry(m);
    p_abc = trianglewithsymmetryforN(m);
    tmp=p_abc(:);%�N��}�ন��x�}[a b]��a
                 %                      b
                                 
    P(i,:)=tmp([1 4 8])';%P(i,:)��i�C�x�},tmp(1:3)�Ĥ@�C��ĤT�C�x�}����,�A��m���@�C��JP����i�C
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
