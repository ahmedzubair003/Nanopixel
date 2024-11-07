
ax1 = axes; 
lum.x0=lum.x0 (:);
lum.y0=lum.y0 (:);
lum.x1=lum.x1 (:);
lum.y1=lum.y1 (:);
lum.x2=lum.x2 (:);
lum.y2=lum.y2 (:);
lum.x0=flip(lum.x0);
lum.y0=flip(lum.y0);
lum.y1=flip(lum.y1);
lum.y2=flip(lum.y2);
lum.x0=1e9*lum.x0;

set(ax1, 'XLim', [400,800])
%lum.y0=lum.y0./max(lum.y0);
plot(lum.x0, lum.y0, lum.x0, lum.y1, lum.x0, lum.y2)
%set(ax1, 'YLim', [0 3e-14])
