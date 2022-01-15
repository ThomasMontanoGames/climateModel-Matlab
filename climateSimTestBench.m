%% Inputs

close all;
clear;

worldSize = 50;

dt = 18*60;
day = 60*60*24;
year = 365.25*day;
solarConst = 1370;

maxTemps = [];
minTemps = [];
maxU = [];
maxV = [];

%% Initialization
atmosphere = generateAtmosphere(worldSize);

time = 0;
sunLon = 0;

timePerStep = zeros(1,801);
steps = 1;
while true
%for steps = 1:40*80
    
    %tic;
    disp("TIME: " + (time/day) + " days");
    atmosphere = updateTemps(atmosphere,dt,solarConst,sunLon);
    atmosphere = updateVelocity(atmosphere,dt);
    atmosphere = advect(atmosphere,dt);

    %timePerStep(steps) = toc;
    
    %if(mod(steps-1,80) == 0)
        cla;
        [temp, u, v] = plotAtmosphere(atmosphere);
        maxU(end+1) = u;
        maxV(end+1) = v;
        if(isnan(temp))
           return; 
        end
        title("TIME: " + (time/day) + " days");
        caxis([100 330]);
        drawnow;
    %end

    tempMatrix = zeros(worldSize,worldSize);
    for i = 1:worldSize
        for j = 1:worldSize
            tempMatrix(i,j) = atmosphere{i,j}.temp;
        end
    end

    maxTemps(end+1) = max(max(tempMatrix));
    minTemps(end+1) = min(min(tempMatrix));
    
    if((time/day) == 90)
        figure();
        plot(linspace(0,90,steps),maxTemps)
        hold on;
        plot(linspace(0,90,steps),minTemps)
        return;
    end
    
    sunLon = sunLon + dt*2*pi/day;
    if(sunLon > 2*pi)
        sunLon = sunLon - 2*pi;
    end
    
    time = time + dt;
    steps = steps + 1;
    
end

disp("Average Time Per Step: " + mean(timePerStep)*1000 + "ms");
%saveas(gcf, "./frames/frame" + string(steps) + ".png",'png');