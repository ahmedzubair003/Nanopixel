function coor=spectrum2XYZ(s,e,name)
ref_name=name;  %file name
start_sp=s;     %first column
end_sp=e;       %last column
%reading the color matching functions  

ciexyz31_1 = csvread('ciexyz31_1.csv');
wl_CMF = ciexyz31_1(:,1);
redCMF = ciexyz31_1(:,2);
greenCMF =ciexyz31_1 (:,3);
blueCMF = ciexyz31_1(:,4);

%reading the illuminant spectrum
ill_D65=xlsread("ill_D65");       %D65 light source
wl_SC=ill_D65(:,1);
source=ill_D65(:,2);

%reading the reflectance spectrum,
%format: first column,wavelength ;second.column reflectance spectrum
RS=xlsread(ref_name);
% rf=zeros(size(RS));

wl_RS=RS(1:end,1);          %get wavelength
    if(wl_RS<10e-6)          %convert to nm if it its unit is m
        wl_RS=wl_RS.*10^9;
    end
    if(wl_RS>10e-6 ) & (wl_RS<1)          %convert to nm if it its unit is um
        wl_RS=wl_RS.*1000;
    end

wl_RS=floor(wl_RS);     %integrating the wavelength
rf=RS(1:end,1:end);         %get all column

%intersection of CMF and source
[wl_com,i1,i2]=intersect(wl_CMF,wl_SC);
%new color mathcing functions(in the intersection wavelength range)
redCMF = ciexyz31_1(i1,2);
greenCMF =ciexyz31_1 (i1,3);
blueCMF = ciexyz31_1(i1,4);
%new illuminant spectrum(in the intersection wavelength range)
source=source(i2);
 
%intersection of CMF,source and reflectance
[wl_com,i3,i4]=intersect(wl_com,wl_RS);
%new color mathcing functions(in the intersection wavelength range)
redCMF = ciexyz31_1(i3,2);
greenCMF =ciexyz31_1 (i3,3);
blueCMF = ciexyz31_1(i3,4);
%new illuminant spectrum(in the intersection wavelength range)
source=source(i3);
%new refelctance spectrum(in the intersection wavelength range)
rf=RS(i4,start_sp:end_sp);  
%wl_com means wavelength range intersection of source CMF and reflectance


k=100/sum(source.*greenCMF);  % calculate k

num=length(rf(1,:));    %number of reflectance spectrums

%initialize XYZ CIE 1931
XYZ=zeros(num,3);
XX=zeros(num,1);
YY=zeros(num,1);
ZZ=zeros(num,1);
for i=1:num
    XX(i)=k*sum(source.*redCMF.*rf(:,i)); % calculate X
    YY(i)=k*sum(source.*greenCMF.*rf(:,i)); % calculate Y
    ZZ(i)=k*sum(source.*blueCMF.*rf(:,i)); % ¼ÆËãZ´Ì¼¤Öµ
    XYZ(i,:)=[XX(i),YY(i),ZZ(i)];
end

%chromaticity coordinate  x y z 
s=XX+YY+ZZ;
x=XX./s; 
y=YY./s;
z=ZZ./s;
coor=[x,y,XX,YY,ZZ];




