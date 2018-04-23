function [inputMatrix,len,crop,Ibox3,Ibw] = captcha_file_reader(I)

% directory = dir('F:\matlab\Data Set\*.png');         %read all images in directory
% directory = dir('*.png'); 
% noOfFiles = length(directory);    %get file count
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

Igray = rgb2gray(I);
% figure;imshow(Igray);title('gray scale');
Ibw = im2bw(Igray,graythresh(Igray));
% figure;imshow(Ibw);title('binary');

Iedge = edge(Ibw);
% Iedge2 = edge(uint8(Ibw));

se=strel('square',2);
Iedge2=imdilate(Iedge,se);

Ifill=imfill(Iedge2,'holes');
Ifill2= bwmorph(Ifill,'erode');
Ifill3= bwmorph(Ifill2,'dilate',1);
Ifill4=imfill(Ifill3,'holes');

[Ilabel, num] = bwlabel(Ifill);
disp(num);
Iprops = regionprops(Ilabel);
Ibox = [Iprops.BoundingBox];
Ibox2=vertcat(Iprops.BoundingBox);
Ibox3=Ibox2;
 w = Ibox2(:,3);
h = Ibox2(:,4);
aspectRatio = w-h>4 | h-w>4;
filterIdx = aspectRatio' < 1;

Iprops(filterIdx)=[];
Ibox3=vertcat(Iprops.BoundingBox);

ITextRegion = insertShape(Igray, 'Rectangle', Ibox3,'LineWidth',3);
% figure;imshow(ITextRegion);

len=length(Ibox3)
for i = 1 : len
    crop{i}=imcrop(Igray,Ibox3(i,:));
end

% for j=1 : len
%    subplot(3,2,j),imshow(crop{j}); 
% end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


inputMatrix = ones(len,15);
for loop = 1 : len
%    tempName = directory(loop).name;
%    imageData = imread(tempName);
   [width,height,blackPixels,s_length,feature,startingXav,startingYav,endingXav,endingYav,thetaav,rhoav] = captcha_feature_extractor(crop{loop});
   inputMatrix(loop,1) = width;
   inputMatrix(loop,2) = height;
   inputMatrix(loop,3) = blackPixels;
   inputMatrix(loop,4) = Ibox3(loop,1);
   inputMatrix(loop,5) = Ibox3(loop,2);
   inputMatrix(loop,6) = Ibox3(loop,3);
   inputMatrix(loop,7) = Ibox3(loop,4);
   inputMatrix(loop,8) = s_length;
   inputMatrix(loop,9) = feature;
   inputMatrix(loop,10) = startingXav;
   inputMatrix(loop,11) = startingYav;
   inputMatrix(loop,12) = endingXav;
   inputMatrix(loop,13) = endingYav;
   inputMatrix(loop,14) = thetaav;
   inputMatrix(loop,15) = rhoav;
%    inputMatrix(loop,8) = centroidx;
%    inputMatrix(loop,9) = centroidy;
%    inputMatrix(loop,8) = area;
   
   %fprintf('========= %s%=========',tempName)
   
end

end