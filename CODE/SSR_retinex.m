function output_ssr = SSR_retinex(img)

img_r = double(img(:,:,1));
img_g = double(img(:,:,2));
img_b = double(img(:,:,3));

img_r_log = log(img_r+1);
img_g_log = log(img_g+1);
img_b_log = log(img_b+1);

R_fft1 = fft2(img_r);
G_fft1 = fft2(img_g);
B_fft1 = fft2(img_b);

%  SSR algorithm
[m,n] = size(img_r);
sigma = 200;
f = fspecial('gaussian', [m, n], sigma);
efft1 = fft2(double(f));

D_r = ifft2(R_fft1.*efft1);
D_g = ifft2(G_fft1.*efft1);
D_b = ifft2(B_fft1.*efft1);

D_r_log = log(D_r + 1);
D_g_log = log(D_g + 1);
D_b_log = log(D_b + 1);

R = img_r_log - D_r_log;
G = img_g_log - D_g_log;
B = img_b_log - D_b_log;

disp(size(R))
%ANTILOG OF THE RGB PLANES
R = exp(R);
R = (R - min(R(:)))/(max(R(:)) - min(R(:)));

G = exp(G);
G = (G - min(G(:)) )/(max(G(:)) - min(G(:)));

B = exp(B);
B = (B - min(B(:)))/(max(B(:)) - min(B(:)));
disp(size(R))

output_ssr = cat(3, R, G, B);