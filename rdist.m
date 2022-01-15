function points = rdist(n)

    u = rand(1,n);
    v = rand(1,n);

    theta = 2*pi*u;
    phi = acos(2*v-1);
    
    points = horzcat(phi', theta');
end