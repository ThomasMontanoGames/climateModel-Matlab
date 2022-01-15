function points = latDist(n)

    theta = linspace(0,2*pi,sqrt(n)+1);
    phi = linspace(0,pi,sqrt(n)+1);
    points = zeros(n,2);
    index = 1;
    
    for i = 1:length(theta)-1
        for j = 1:length(phi)-1
            points(index,:) = [phi(j) theta(i)];
            index = index + 1;
        end
    end
    
    %points = horzcat(phi',theta');

end