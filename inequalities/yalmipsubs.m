function new = yalmipsubs(old, s, r)
    new = old;
    for i = 1:length(s)
        new = replace(new, s(i), r(i));
    end
end
