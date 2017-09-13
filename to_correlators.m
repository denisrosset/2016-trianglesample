function Csym = to_correlators(Psym)
    P000 = Psym(1);
    P001 = Psym(2);
    P011 = Psym(3);
    P111 = Psym(4);
    P = [P000 P001 P001 P011 P001 P011 P011 P111]';
    M2 = [1 1; 1 -1];
    C = kron(M2, kron(M2, M2)) * P;
    Csym = [C(2) C(4) C(8)];
    assert(abs(C(1,1,1) - 1) < 1e-6);
end
