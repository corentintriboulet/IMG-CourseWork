% display_filter_responses
%
% enter filter type and design parameters
D0=50; % cutoff frequency (range 0 to 250)
D0=input('value for cutoff frequency (range 0 to 250):');
ftype=input('filter type (gaussian, ideal, btw (butterworth)):','s');
if (ftype(1:3) == 'gau')
    H0=lpfilter('gaussian',500,500,D0);
    stitle1=sprintf('gaussian filter response with D0= %d',D0);
    stitle2=sprintf('gaussian impulse response with D0= %d',D0);
elseif (ftype(1:3) == 'ide')
    H0=lpfilter('ideal',500,500,D0);
    stitle1=sprintf('ideal filter response with D0= %d',D0);
    stitle2=sprintf('ideal impulse response with D0= %d',D0);
elseif (ftype(1:3) == 'btw')
    n=input('butterworth filter order (1 to 6):');
    H0=lpfilter('btw',500,500,D0,n);
    stitle1=sprintf('butterworth filter response with D0= %d, n= %d',D0,n);
    stitle2=sprintf('butterworth impulse response with D0= %d, n= %d',D0,n);
else
    error('improper filter type specified');
end

ilphp=input('lowpass (1) or highpass (0) filter:');

if (ilphp == 0) 
    H0=1-H0;
end
% display frequency response of lowpass filter using mesh plot
H=fftshift(H0);
figure,mesh(H(1:10:500, 1:10:500));
axis([0 50 0 50 0 1]);
title(stitle1);

% convert from spectral to spatial domain
h=real(ifft2(H));
hmax=max(max(h));
h=h/hmax;
hc=fftshift(h);

% determine region of support for impulse response
hsize=size(hc);
middle=hsize(1)/2;
hmax=max(max(hc));
h1=find(hc(middle,:)>hmax/100.);
startpt=max(h1(1)-10,1);
endpt=min(h1(end)+10,hsize(1));

% display impulse response of lowpass filter using mesh plot
figure,mesh(hc(1:10:500, 1:10:500));
axis([0 50 0 50 0 1]);
title(stitle2);

% display response on finer scale
figure,mesh(hc(225:2:275, 225:2:275));
axis([0 25 0 25 0 1]),title(stitle2);
figure,mesh(hc(startpt:1:endpt, startpt:1:endpt));
axis([0 (endpt-startpt+1) 0 (endpt-startpt+1) 0 1]),title(stitle2);

% display impulse response at center spatial line
figure,plot(hc(middle,startpt:endpt),'b','LineWidth',2);