

% Load test data
load ciede2000testdata.txt


Labstd = ciede2000testdata(:,1:3);
Labsamp = ciede2000testdata(:,4:6);
%dE00result = ciede2000testdata(:,7);

% Comupute the CIEDE2000 color difference between the pairs

dE00 = deltaE2000(Labstd,Labsamp);
% Compare the computation vs the published result
Nsamp = size(Labstd,1);
vv= [1:Nsamp];
plot(vv,dE00, '+', vv,dE00result, 'o');
legend('Implemention','Published');

% Repeat test by interchaging sample vs testdata order and 
% see whether differences remain same
dE00t = deltaE2000(Labsamp,Labstd);
vv= [1:Nsamp];
figure; plot(vv,dE00t, '+', vv,dE00result, 'o');
legend('Implement (sampNstdexch)','Published');

% Numerically verify that the difference is small
max(abs(dE00'-dE00result))
% typical values around 4 x 10^-5
