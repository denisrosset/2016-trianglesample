function P = discrete_sample(n)
% discrete_sample Samples the triangle distribution with symmetric lhv and responses
%
% n is the number of local hidden variable symbols
    
    % sample the weights such that weights(i) >= 0 and sum(weights) == 1
    weights = rand(1, n);
    weights = weights/sum(weights);
    % sample the response function, 0 <= probs0(l1, l2) <= 1
    % gives the probability to output the bit 0 given lhv `l1` and `l2`
    probs0 = rand(n, n);
    % we only compute the relevant subset of output joint probabilities
    P000 = 0;
    P001 = 0;
    P011 = 0;
    P111 = 0;
    % sum over all combinations of local hidden variables
    for l1 = 1:n
        for l2 = 1:n
            for l3 = 1:n
                w = weights(l1) * weights(l2) * weights(l3);
                P000 = P000 + w * probs0(l1, l2) * probs0(l2, l3) * probs0(l3, l1);
                P001 = P001 + w * (1 - probs0(l1, l2)) * probs0(l2, l3) * probs0(l3, l1);
                P011 = P011 + w * (1 - probs0(l1, l2)) * (1 - probs0(l2, l3)) * probs0(l3, l1);
                P111 = P111 + w * (1 - probs0(l1, l2)) * (1 - probs0(l2, l3)) * (1 - probs0(l3, l1));
            end
        end
    end
    % output the relevant probabilities
    P = [P000 P001 P011 P111];
end
