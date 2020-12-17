function features=RID_SIVP21(image)

% Source code of "Recaptured image forensics based on normalized local ternary
% count histograms of residual maps" in Signal, Image and Video Processing 2021.
% 
% Author: Nan Zhu
% Digital Media Forensics Lab, Department of Electronic Information Engineering, 
% Xi'an Technological University, Xi'an 710021, China
% Email: nanzhu.xatu@foxmail.com

% Usage: feature_vector = RID_SIVP21(image)
% image: a RGB image's name or a 3-D matrix
% features: extracted 36-dimensional feature vector


if ischar(image)
    f=double(rgb2gray(imread(image)));   % if input is a RGB image's name
else 
    f=double(rgb2gray(image));   % if input is a 3-D matrix
end

Wiener_f=wiener2(f);   % Wiener filtering
PredictError=f-Wiener_f; % Residual map

Set1=getLTC(PredictError);

%%%%%%%%%%%%%%

[m,n]=size(f);

if mod(m,2)==0
    m=m-1;
end
if mod(n,2)==0
    n=n-1;
end

DownSample=(f(2:2:m,2:2:n)+f(2:2:m,3:2:n)+f(3:2:m,2:2:n)+f(3:2:m,3:2:n))/4; % Downsampled image

Wiener_DownSample=wiener2(DownSample);
PredictError2=DownSample-Wiener_DownSample;

Set2=getLTC(PredictError2);  


features=[Set1,Set2];
