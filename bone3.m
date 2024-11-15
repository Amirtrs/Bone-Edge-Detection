clc
clear all
close all

%% Image 

img = (imread('4.jpg'));

B = 10; 
MinHoughPeakDistance = 10; 



%% Filter 

img = (rgb2gray(img)); % Load image
img = imfilter(img, fspecial('gaussian', 5, B), 'symmetric');
figure()
imshow(img)


boneEdges = edge(img, 'sobel',0.028);
boneEdges = bwmorph(boneEdges, 'close');
figure()
imshow(boneEdges) 
edgeRegs = regionprops(boneEdges, 'Area', 'PixelIdxList');

%% Edge detector

AreaList = sort(vertcat(edgeRegs.Area), 'descend');
edgeRegs(~ismember(vertcat(edgeRegs.Area), AreaList(1:2))) = [];
edgeImg = zeros(size(img, 1), size(img,2));
edgeImg(vertcat(edgeRegs.PixelIdxList)) = 1;
figure()
imshow(edgeImg) 


%% Hough Transform

[H,T,~] = hough(edgeImg,'Theta',-20:2:50);
maxHough = max(H, [], 1);
HoughThresh = (max(maxHough) - min(maxHough))/2 + min(maxHough);
[~, HoughPeaks] = findpeaks(maxHough,'MINPEAKHEIGHT',HoughThresh, 'MinPeakDistance', MinHoughPeakDistance);


%% plot Results

figure()
plot(T, maxHough);
hold on
plot([min(T) max(T)], [HoughThresh, HoughThresh], 'r');
plot(T(HoughPeaks), maxHough(HoughPeaks), 'rx', 'MarkerSize', 12, 'LineWidth', 2);
hold off
xlabel('Theta Value'); ylabel('Max Hough Transform');
legend({'Max Hough Transform', 'Hough Peak Threshold', 'Detected Peak'});


% Convert the image to double for activecontour function
imgDouble = im2double(img);

% Initialize the level set function using the edge regions
initialLSF = edgeImg;

% Perform active contour segmentation
finalLSF = activecontour(imgDouble, initialLSF, 150, 'Chan-Vese');

% Find the contour of the segmented region
contour = bwboundaries(finalLSF);

% Display the original image with the contour overlaid
figure();
imshow(img);
hold on;
plot(contour{1}(:, 2), contour{1}(:, 1), 'r', 'LineWidth', 2);
hold off;