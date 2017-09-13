addpath(genpath('~/software/yalmip'));
addpath(genpath('~/software/sedumi'));

syms u v w real;
syms A B C AB AC BC ABC real;

coeffs = ineqcoefficients;

mons = [1 A B C AB AC BC ABC A*B A*C B*C C*AB B*AC A*BC A*B*C]';

vars = [A B C AB AC BC ABC];

ID = vars;

FA = [-A B C -AB -AC BC -ABC];
FB = [A -B C -AB AC -BC -ABC];
FC = [A B -C AB -AC -BC -ABC];

FAB = [-A -B C AB -AC -BC ABC];
FAC = [-A B -C -AB AC -BC ABC];
FBC = [A -B -C -AB -AC BC ABC];

FABC = [-A -B -C AB AC BC -ABC];

makesym = [u u u v v v w];


ineqs = coeffs*mons;

fliplabels = {'id' 'A' 'B' 'C' 'AB' 'AC' 'BC' 'ABC'};
flips = {ID FA FB FC FAB FAC FBC FABC};


su = sdpvar(1,1);
sv = sdpvar(1,1);
sw = sdpvar(1,1);

warning off;
options = sdpsettings('solver', 'bmibnb', 'verbose', 1, 'usex0', 1);
options = sdpsettings(options, 'bmibnb.roottight', 1);
options = sdpsettings(options, 'bmibnb.lpreduce', 0);
options = sdpsettings(options, 'bmibnb.lowersolver', 'linprog');
options = sdpsettings(options, 'bmibnb.lpsolver', 'linprog');
options = sdpsettings(options, 'linprog.LargeScale', 'off');
options = sdpsettings(options, 'linprog.Algorithm', 'dual-simplex');
options = sdpsettings(options, 'bmibnb.relgaptol', 1e-5);
options = sdpsettings(options, 'bmibnb.absgaptol', 1e-5);
options = sdpsettings(options, 'bmibnb.vartol', 1e-4);

CONS = [3*su + 3*sv + sw + 1 >= 0
        su - sv - sw + 1 >= 0
        sw - sv - su + 1 >= 0
        3*sv - 3*su - sw + 1 >= 0
        -1 <= su
        su <= 1
        -1 <= sv
        sv <= 1
        -1 <= sw
        sw <= 1];

OBJS = zeros(length(ineqs), length(flips));
for i = 1:length(flips)
    for j = 1:length(ineqs)
        disp(['inequality ' num2str(j) ' flip ' fliplabels{i}]);
        flipped = subs(subs(ineqs(j), vars, flips{i}), vars, makesym);
        assign(su, 0);
        assign(sv, 0);
        assign(sw, 0);
        f = matlabFunction(flipped, 'Vars', [u v w]);
        obj = f(su, sv, sw);
        optimize(CONS, obj, options);
        OBJS(j, i) = value(obj);
        value(obj)
    end
end

for i = 1:length(flips)
    for j = 1:length(ineqs)
        if OBJS(j, i) < -1e-6
            disp([char(subs(subs(ineqs(j), vars, flips{i}), vars, makesym)) ', ']);
        end
    end
end
