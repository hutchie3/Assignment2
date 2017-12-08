clc;
clear all;
close all;

StartingFrame = 1;
EndingFrame = 250;

Xcentroid = [];
Ycentroid = [];


for k = StartingFrame:EndingFrame - 1
    
    rgb = imread(['balls/img', sprintf('%2.3d',k),'.jpg']);
    
    imshow(rgb)
    pause(0.01)
    hsv = rgb2hsv(rgb);
    %     imshow(hsv)
    %     pause(0.1)
    
    [BWBlue,maskedRGBImageBlue] = createMaskBlue(rgb);
    %     imshow(BWBlue)
    %     pause(0.05)
    [labelsBlue, numberBlue] = bwlabel(BWBlue, 8);
    
    [BWGreen,maskedRGBImageGree] = createMaskGreen(rgb);
    %     imshow(BWBlue)
    %     hold on;
    %     imshow(BWGreen)
    %     pause(0.05)
    [labelsGreen, numberGreen] = bwlabel(BWGreen, 8);
    
    
    if numberBlue > 0
        
        IstatsBlue = regionprops(labelsBlue, 'basic', 'Centroid');
        
        [valuesBlue, indexBlue] = sort([IstatsBlue.Area],'descend');
        [maxValBlue, maxIndexBlue] = max([IstatsBlue.Area]);
        
        hold on;
        
        XcentroidBlue(k) = IstatsBlue(maxIndexBlue).Centroid(1);
        YcentroidBlue(k) = IstatsBlue(maxIndexBlue).Centroid(2);
        
        %         Xcentroid = [Xcentroid Istats(maxIndex).Centroid(1)];
        %         Ycentroid = [Ycentroid Istats(maxIndex).Centroid(2)];
        
    end
    if numberGreen > 0
        
        IstatsGreen = regionprops(labelsGreen, 'basic', 'Centroid');
        
        [valuesGreen, indexGreen] = sort([IstatsGreen.Area],'descend');
        [maxValGreen, maxIndexGreen] = max([IstatsGreen.Area]);
        
        hold on;
        
        XcentroidGreen(k) = IstatsGreen(maxIndexGreen).Centroid(1);
        YcentroidGreen(k) = IstatsGreen(maxIndexGreen).Centroid(2);
        
        %         Xcentroid = [Xcentroid Istats(maxIndex).Centroid(1)];
        %         Ycentroid = [Ycentroid Istats(maxIndex).Centroid(2)];
        
    end

end

figure(2)
imshow('img489.jpg')
hold on
scatter( XcentroidBlue, YcentroidBlue,'bo');
hold on
scatter( XcentroidGreen, YcentroidGreen,'g*');

