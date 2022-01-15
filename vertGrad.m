function gradient = vertGrad(atmosphere,i,j)

    R = 6.4E6;
    gradient = struct("u",0,"v",0,"temp",0);
    
    overlap = 0;
    
    if(i == 1)
        upperPoint = atmosphere{size(atmosphere,1),j};
        %overlap = pi;
    else    
        upperPoint = atmosphere{i-1,j};
    end
    
    if(i == size(atmosphere,1))
        lowerPoint = atmosphere{1,j};
        %overlap = pi;
    else
        lowerPoint = atmosphere{i+1,j};
    end
    
    a = sin((upperPoint.lat - lowerPoint.lat)/2)^2 + cos(upperPoint.lat)*cos(lowerPoint.lat)*sin((upperPoint.lon-lowerPoint.lon)/2)^2;
    c = 2*atan2(sqrt(a),sqrt(1-a));
    dist = R * c;
    %dist = R * abs(sqrt((upperPoint.lat - lowerPoint.lat)^2 + (upperPoint.lon - lowerPoint.lon)^2) - overlap);
    %dist = abs(upperPoint.lat - lowerPoint.lat - overlap);
    %dist = sin(atmosphere{i,j}.lat) * R * abs(acos((sin(upperPoint.lat) * sin(lowerPoint.lat)) + (cos(upperPoint.lat) * cos(lowerPoint.lat) * cos(lowerPoint.lon-upperPoint.lon))) - overlap);
    
    gradient.u = (upperPoint.u - lowerPoint.u)/dist;
    gradient.v = (upperPoint.v - lowerPoint.v)/dist;
    gradient.temp = (upperPoint.temp - lowerPoint.temp)/dist;
    
end