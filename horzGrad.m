function gradient = horzGrad(atmosphere,i,j)
    
    R = 6.4E6;
    gradient = struct("u",0,"v",0,"temp",0);
    
    overlap = 0;
    
    if(j == 1)
        upperPoint = atmosphere{i,size(atmosphere,1)};
        overlap = 2*pi;
    else    
        upperPoint = atmosphere{i,j-1};
    end
    
    if(j == size(atmosphere,1))
        lowerPoint = atmosphere{i,1};
        overlap = 2*pi;
    else
        lowerPoint = atmosphere{i,j+1};
    end
    
    dist = R * abs(sqrt((upperPoint.lat - lowerPoint.lat)^2 + (upperPoint.lon - lowerPoint.lon)^2) - overlap);
    %dist = abs(upperPoint.lon - lowerPoint.lon - overlap);
    %dist = R * abs(acos((sin(upperPoint.lat) * sin(lowerPoint.lat)) + (cos(upperPoint.lat) * cos(lowerPoint.lat) * cos(lowerPoint.lon-upperPoint.lon))) - overlap);
    
    gradient.u = (lowerPoint.u - upperPoint.u)/dist;
    gradient.v = (lowerPoint.v - upperPoint.v)/dist;
    gradient.temp = (lowerPoint.temp - upperPoint.temp)/dist;

end