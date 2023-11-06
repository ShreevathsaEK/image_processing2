clc;
clear all;
close all;

%% Taking an Image
[fname, path] = uigetfile('.png', 'Open an Image as input for training');
fname = strcat(path, fname);
im = imread(fname);
im = im2bw(im);
imshow(im);
title('Input Image');
c = input('Enter the Class (Number from 1-12): ');

%% Feature Extraction
F = FeatureStatistical(im);

try
    load db;
    F = [F c];
    db = [db; F];
    save db.mat db;
catch
    db = [F c];
    save db.mat db;
end
