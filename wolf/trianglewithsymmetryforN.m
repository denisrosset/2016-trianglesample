function p_abc = trianglewithsymmetryforN(N)
%alpha=l;
%beta=m;
%gamma=n;
%N=3;
o=rand(1,N);
p = zeros(2,N,N);%����6�Ө�C��檺�x�}
p(1,:,:) = rand(N,N) ;%6��2x2�x�}���Ĥ@�C���H���ܼ�V
p(2,:,:) = 1-p(1,:,:);
z=(o(1,:))/(sum(o));
p_abc=zeros(2,2,2);
p_l=z;
p_m=z;
p_n=z;
p_a_m_n=p;%���w�x�}P���Ĥ@�C��ĤG�C;�Ĥ@���ĤG��;�Ĥ@��2x2�x�}��ĤG��2x2�x�}��p_a_m_n
p_b_n_l=p;
p_c_l_m=p;
tol = 1e-9;%�]�w�~�t�Ƚd��
% assert(abs(p_a_m_n(1,1,1) + p_a_m_n(2,1,1) - 1) < tol);%���wm,n,sum all a�����v�M��1(�T�O5~15code�B�⥿�T)
% assert(abs(p_a_m_n(1,2,1) + p_a_m_n(2,2,1) - 1) < tol);
% assert(abs(p_a_m_n(1,3,1) + p_a_m_n(2,3,1) - 1) < tol);
% assert(abs(p_a_m_n(1,1,2) + p_a_m_n(2,1,2) - 1) < tol);
% assert(abs(p_a_m_n(1,2,2) + p_a_m_n(2,2,2) - 1) < tol);
% assert(abs(p_a_m_n(1,3,2) + p_a_m_n(2,3,2) - 1) < tol);
% assert(abs(p_a_m_n(1,1,3) + p_a_m_n(2,1,3) - 1) < tol);
% assert(abs(p_a_m_n(1,2,3) + p_a_m_n(2,2,3) - 1) < tol);
% assert(abs(p_a_m_n(1,3,2) + p_a_m_n(2,3,2) - 1) < tol);
for i =1:8
    [a, b, c] = ind2sub([2,2,2],i);%[2,2,2]=111,211,121...,222;i=1��111�Ya=1,b=1,c=1
    for l =1:N
        for n=1:N
            for m=1:N

                    p_abc(a,b,c) = p_abc(a,b,c)+ p_l(l)*p_m(m)*p_n(n)*p_a_m_n(a,m,n)*p_b_n_l(b,n,l)*p_c_l_m(c,l,m);
                    

            end;
        end;
    end;
end;

end