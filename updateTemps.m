function newAtmosphere = updateTemps(atmosphere,dt,solarConst,sunLon)

    newAtmosphere = atmosphere;

    for i = 1:size(atmosphere,1)
       for j = 1:size(atmosphere,2)
          
           newAtmosphere{i,j}.temp = atmosphere{i,j}.temp + dt*(...
               solarConst*(1-atmosphere{i,j}.albedo)*max(0,sin(atmosphere{i,j}.lat))...
               *max(0,sin(atmosphere{i,j}.lon-sunLon)) - (5.67E-8)*(atmosphere{i,j}.temp^4)...
               )/atmosphere{i,j}.heatCap;
           
%            if(isinf(newAtmosphere{i,j}.temp))
%               j; 
%            end
            
       end
    end

end
% 
% def update_temp(self,dt,solar_constant,sun_lon):    
%         self.temp += dt*(
%             solar_constant*(1-self.albedo)*max(0,np.sin(self.lat))*max(0,np.sin(self.lon-sun_lon)) 
%             - (5.67E-8)*(self.temp**4)
%             )/self.heat_capacity