function atmosphere = generateAtmosphere(worldSize)

%sphere = [];
%while(length(sphere) ~= worldSize*worldSize)
    %sphere = %pdisk2([pi 2*pi], 4670);%latDist(worldSize*worldSize);
%end
sphere = latDist(worldSize*worldSize);%generateFibSphere(worldSize*worldSize);
pixels = pixel.empty;

for i = 1:length(sphere)   
   pixels(i) = pixel(sphere(i,1),sphere(i,2));
end

atmosphere = cell(worldSize,worldSize);
possibleLats = horzcat([pixels.lat]',[pixels.lon]',(1:worldSize*worldSize)');

for i = 1:worldSize
   
    possibleLats = sortrows(possibleLats,'descend');
    
    topPoints = possibleLats(1:worldSize,:);
    topPoints = sortrows(topPoints,2);
    possibleLats(1:worldSize,:) = [];
    
    for j = 1:worldSize
       
        atmosphere{i,j} = pixels(topPoints(j,3));
        
    end
    
end

end
