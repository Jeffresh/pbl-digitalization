clear,close all,clc;

im = imread('p2.png');
im = rgb2gray(im);
im = imresize(im, [482, 482]);
%figure,imshow(im);
%% Get data
%%[row, col] = find(imrotate(im, 180) == 0);
[row, col] = find(im == 0);
x(1,:) = col;
x(2,:) = row;
%figure,plot(x(1,:) , x(2,:), 'k.');

%%
radio = 50;
radio_excl = 100;
disp('Starting System')
x = shuffle(x);
[centros, y_pred, classes] = adaptativeMethod(x,radio, radio_excl, false);
disp('Finished')
disp(['Número de aspersores ', num2str(size(centros, 2))])
%% Recompute solution
disp('Starting System')
[centroids, y, c_class] = computeCentroids(x, y_pred, centros, radio, radio_excl);
disp('Finished')

%%

drawSolution(x, y, centroids, 'centroids')
%%
countOverlapping(c_class)
countNotAssigned(c_class)
