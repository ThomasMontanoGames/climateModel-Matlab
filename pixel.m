classdef pixel
   
    properties(Access = public)
        lat;
        lon;
        temp;
        u;
        v;
        heatCap;
        albedo;
        f;
    end
    
    methods
        function obj = pixel(newlat,newlon)
            obj.lat = newlat;
            obj.lon = newlon;
            obj.temp = 270 + 20*sin(obj.lat);
            
            obj.u = 0;
            obj.v = 0;
            
            obj.albedo = 0.3;
            obj.heatCap = 1E5;
            
            obj.f = 1E-5*cos(newlat);
        end
        
    end
    
end