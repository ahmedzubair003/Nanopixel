
clear;
figure(1);

%this script can calculate multiple spectra at once
%s means the first column need to be calculated
%e menas the last column need to be calculated
s=2;    %start column
e=4;   %end column
name='2_TiN_Sphere_PTh.xlsx';

plotChromaticity();
%plot  CIE 1931 diagram

hold on;
coor=spectrum2XYZ(s,e,name);
x=coor(:,1);
y=coor(:,2);
sz=30;
scatter(x,y,sz,'r','filled');
grid off
%plot x y coordinate on CIE1931 diagram


%% plot color patch

z=1-x-y;
%change xyz to rgb value

%convert to uint8 type
rgb=xyz2rgb([x,y,z],'OutputType','uint8');
rgb_255=rgb;
lab=rgb2lab(rgb_255)
lab(2,:) = []
lab = reshape(lab', 1, []);
writematrix(lab,'ciede2000testdata.txt');
type ciede2000testdata.txt


%convert to 0-1 type
rgb=double(rgb)/255;

%%plot color patch
figure(2);

for i=1:(e-s+1)
rectangle('Position',[5*(i-1),0,5,5],'Curvature', [0 0], 'FaceColor',rgb(i,:));
end
title('Reduced         Semi-Ox        Oxidized');
set (gca,'YTick', []);
set (gca,'XTick', []);
% hold on;
