function atmosphere = updateVelocity(atmosphere,dt)
    
    for i = 1:size(atmosphere,1)
       for j = 1:size(atmosphere,2)
           
           hGrad = horzGrad(atmosphere,i,j);
           vGrad = vertGrad(atmosphere,i,j);
           
           atmosphere{i,j}.u = atmosphere{i,j}.u - dt*(...
               atmosphere{i,j}.u*hGrad.u ...
               + atmosphere{i,j}.v*vGrad.u...
               + atmosphere{i,j}.f*atmosphere{i,j}.v...
               + hGrad.temp);
           
           atmosphere{i,j}.v = atmosphere{i,j}.v - dt*(...
               atmosphere{i,j}.u*hGrad.v ...
               + atmosphere{i,j}.v*vGrad.v...
               - atmosphere{i,j}.f*atmosphere{i,j}.u ...
               + vGrad.temp);
               
       end
    end

end


% self.u -= dt*( 
%             self.u*field_d_lon(u,self.lat,self.lon) 
%             + self.v*field_d_lat(u,self.lat,self.lon) 
%             + self.f*self.v 
%             + field_d_lon(temp,self.lat,self.lon) 
%             )
%     
%self.v -= dt*( self.u*field_d_lon(v,self.lat,self.lon) 
%             + self.v*field_d_lat(v,self.lat,self.lon) 
%             - self.f*self.u + field_d_lat(temp,self.lat,self.lon) )
    