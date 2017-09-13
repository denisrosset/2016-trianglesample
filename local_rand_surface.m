function [U V W] = local_rand_surface(Csym)
    u = Csym(1);
    v = Csym(2);
    w = Csym(3);
    mu = -1:0.1:1;
    eta = 0:0.05:1;
    U = zeros(length(mu),length(eta));
    V = U;
    W = U;
    for i = 1:length(mu)
        for j = 1:length(eta)
            m = mu(i);
            e = eta(j);
            U(i,j) = e*u + (1-e)*m;
            V(i,j) = e^2*v + e*(1-e)*u*m + (1-e)^2*m^2;
            W(i,j) = e^3*w + e^2*(1-e)*v*m + e*(1-e)^2*u*m^2+(1-e)^3*m^3;
        end
    end
end
