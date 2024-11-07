ax1 = axes;
plot(lum.x0, lum.y0.*1e14, 'b', lum.x1, lum.y1.*1e14, 'black',lum.x2, lum.y2.*1e14, 'r')
set(ax1, 'XLim', [400 800])
%set(ax1, 'YLim', [0 1.4e-14])
set(ax1,'XGrid', 'off')
set(ax1,'YGrid', 'off')
xlabel('Wavelength (nm)')
ylabel('SCS (x10^{-14} m^2)')
legend('Red','Semi-Ox','Ox')
lum.x0=lum.x0';
lum.y1=lum.y1';
lum.y2=lum.y2';
lum.y0=lum.y0';