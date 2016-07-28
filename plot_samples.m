% number of samples
Ns = [1000 1000 1000 1000];
% number of symbols
ns = [2 4 8 16];
% color of symbols
cs = {[0 0 0] [0.2 0.2 0.2] [0.4 0.4 0.4] [0.6 0.6 0.6]};
clf;
hold on;
% for each number of symbols
for j = 1:length(ns)
    % get a number of samples
    x = [];
    y = [];
    z = [];
    for i = 1:Ns(j)
        P = discrete_sample(ns(j));
        x = [x P(1)];
        y = [y P(2)];
        z = [z P(3)];
    end
    % plot the samples
    plot3(x,y,z,'.','MarkerEdgeColor',cs{j});
end
% plot the "never-the-same-response" 3-local point
plot3(0, 1/6, 1/6, 'x', 'LineWidth', 10, 'MarkerEdgeColor', [1 0 0]);
xlabel('P000');
ylabel('P001');
zlabel('P011');