function newAtmosphere = advect(atmosphere,dt)

    newAtmosphere = atmosphere;

    for i = 1:size(atmosphere,1)
       for j = 1:size(atmosphere,2)
           
           hGrad = horzGrad(atmosphere,i,j);
           vGrad = vertGrad(atmosphere,i,j);
           
           newAtmosphere{i,j}.temp = max(0,atmosphere{i,j}.temp - dt*(...
               atmosphere{i,j}.temp*hGrad.u ...
               + atmosphere{i,j}.u*hGrad.temp ...
               + atmosphere{i,j}.temp*vGrad.v ...
               + atmosphere{i,j}.v*vGrad.temp...
               ));
           
       end
    end
end

% self.temp -= dt*( 
%             self.temp*field_d_lon(u,self.lat,self.lon) + self.u*field_d_lon(temp,self.lat,self.lon) +
%             self.temp*field_d_lat(v,self.lat,self.lon) + self.v*field_d_lat(temp,self.lat,self.lon) 
%             )