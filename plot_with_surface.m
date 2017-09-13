Csym = to_correlators(discrete_sample(2));
[U V W] = local_rand_surface(Csym);
hold on;
scatter3(Csym(1), Csym(2), Csym(3));
surf(U, V, W);
axis([-1 1 -1 1 -1 1]);
xlabel('<A>');
ylabel('<AB>');
zlabel('<ABC>');
