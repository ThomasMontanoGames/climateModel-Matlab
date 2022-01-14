function plotAtmosphere(atmosphere)

%     temp = vertcat([atmosphere.lat],[atmosphere.temp])';
%     temp = sortrows(temp);
%     
%     contourf(linspace(0,2*pi,50),linspace(0,pi,50),reshape(temp(:,2),50,[])',"edgecolor",'none');
%     hold on;
%     axis equal;
%     scatter([atmosphere.lon],[atmosphere.lat],5,'k','filled');
%     xlim([0 2*pi]);
%     ylim([0 pi]);
%     colorbar;

    worldSize = size(atmosphere,1);
    tempMatrix = zeros(worldSize,worldSize);
    lat = zeros(1,worldSize*worldSize);
    lon = zeros(1,worldSize*worldSize);
    us = zeros(1,worldSize*worldSize);
    vs = zeros(1,worldSize*worldSize);
    index = 1;
    for i = 1:worldSize
        for j = 1:worldSize
            
            tempMatrix(i,j) = atmosphere{i,j}.temp;
            lat(index) = atmosphere{i,j}.lat;
            lon(index) = atmosphere{i,j}.lon;
            us(index) = atmosphere{i,j}.u;
            vs(index) = atmosphere{i,j}.v;
            index = index + 1;
        end
    end

    contourf(linspace(0,2*pi,worldSize),linspace(0,pi,worldSize),tempMatrix,"edgecolor",'none');
    hold on;
    scatter(lon,lat,5,'k','filled');
    quiver(lon,lat,us,vs,2);
    colorbar;
    axis equal;
    xlim([0 2*pi]);
    ylim([0 pi]);
    
    disp("T: " + round(max(max(tempMatrix))-273.15,1) + " - " + round(min(min(tempMatrix))-273.15,1),' C');
    disp("U: " + round(max(us),2) + " - " + round(min(us),2) + " V: " + round(max(vs),2) + " - " + round(min(vs),2));

end