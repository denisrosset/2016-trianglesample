

syms u v w real;
syms A B C AB AC BC ABC real;
% cte <A> <B> <C> <AB> <AC> <BC> <ABC> <A><B> <A><C> <B><C> <C><AB> <B><AC> <A><BC> <A><B><C>

mons = [1 A B C AB AC BC ABC A*B A*C B*C C*AB B*AC A*BC A*B*C];

vars = [A B C AB AC BC ABC];
perm1 = [B C A BC AB AC ABC];
perm2 = [B A C AB BC AC ABC];

flipA = [-A B C -AB -AC BC -ABC];
flipB = [A -B C -AB AC -BC -ABC];
flipC = [A B -C AB -AC -BC -ABC];

flipAB = [-A -B C AB -AC -BC ABC];
flipAC = [-A B -C -AB AC -BC ABC];
flipBC = [A -B -C -AB -AC BC ABC];

flipABC = [-A -B -C AB AC BC -ABC];

addpath(genpath('~/software/yalmip'));
addpath(genpath('~/software/sedumi'));

listC = [1;A;B;AB;C;AC;BC;ABC];
M2 = [1 1; 1 -1];
nonzero = kron(M2, kron(M2, M2)) * listC;

makesym = [u u u v v v w];


positivity = 
