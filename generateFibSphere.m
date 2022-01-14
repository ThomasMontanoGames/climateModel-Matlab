function sphere = generateFibSphere(numPoints)

    sphere = zeros(numPoints,2);
    
    phi = pi * (3-sqrt(5));
    
    for i = 0:numPoints-1
       
        y = 1 - (i/(numPoints-1))*2;
        radius = sqrt(1- y * y);
        
        golden = phi * i;
        
        x = cos(golden) * radius;
        z = sin(golden) * radius;
        
        theta = acos(z);
        varphi = atan2(y,x) + pi;
        
        sphere(i+1,:) = [theta, varphi];
        
    end
    
end