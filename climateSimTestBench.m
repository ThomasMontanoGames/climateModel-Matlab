%% Inputs

close all;
clear;

worldSize = 50;

dt = 18*60;
day = 60*60*24;
year = 365.25*day;
solarConst = 1370;

%% Initialization
atmosphere = generateAtmosphere(worldSize);

time = 0;
sunLon = 0;

timePerStep = zeros(1,801);
steps = 1;
%while true
for steps = 1:801
    
    tic;
    disp("TIME: " + (time/day) + " days");
    atmosphere = updateTemps(atmosphere,dt,solarConst,sunLon);
    atmosphere = updateVelocity(atmosphere,dt);
    atmosphere = advect(atmosphere,dt);

    timePerStep(steps) = toc;
    
    if(mod(steps,80) == 0)
        cla;
        plotAtmosphere(atmosphere);
        title("TIME: " + (time/day) + " days");
        %caxis([100 330]);
        drawnow;
    end
    
    sunLon = sunLon + dt*2*pi/day;
    if(sunLon > 2*pi)
        sunLon = sunLon - 2*pi;
    end
    
    time = time + dt;
    
end

disp("Average Time Per Step: " + mean(timePerStep)*1000 + "ms");
%saveas(gcf, "./frames/frame" + string(steps) + ".png",'png');