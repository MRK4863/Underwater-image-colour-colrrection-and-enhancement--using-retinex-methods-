function output_img = MSR_retinex(img)

img_r = double(img(:,:,1));
img_g = double(img(:,:,2));
img_b = double(img(:,:,3));

img_r_log = log(img_r+1);
img_g_log = log(img_g+1);
img_b_log = log(img_b+1);

Rfft1 = fft2(img_r);
Gfft1 = fft2(img_g);
Bfft1 = fft2(img_b);
[r,c] = size(img_r);

%VARIOUS STANDARD DEVIATION VALUES
sig1 = 15;
sig2 = 80;
sig3 = 200;

% rotationally symmetric Gaussian lowpass filter  of size (ROW, COL) of original image
%with standard deviation (SIG).
f1 = fspecial('gaussian', [r, c], sig1);
f2 = fspecial('gaussian', [r, c], sig2);
f3 = fspecial('gaussian', [r, c], sig3);

efft1 = fft2(double(f1));
efft2 = fft2(double(f2));
efft3 = fft2(double(f3));

D_r1 = ifft2(Rfft1.*efft1);
D_g1 = ifft2(Gfft1.*efft1);
D_b1 = ifft2(Bfft1.*efft1);
D_r_log1 = log(D_r1 + 1);
D_g_log1 = log(D_g1 + 1);
D_b_log1 = log(D_b1 + 1);
R1 = img_r_log - D_r_log1;
G1 = img_g_log - D_g_log1;
B1 = img_b_log - D_b_log1;

D_r2 = ifft2(Rfft1.*efft2);
D_g2 = ifft2(Gfft1.*efft2);
D_b2 = ifft2(Bfft1.*efft2);
D_r_log2 = log(D_r2 + 1);
D_g_log2 = log(D_g2 + 1);
D_b_log2 = log(D_b2 + 1);
R2 = img_r_log - D_r_log2;
G2 = img_g_log - D_g_log2;
B2 = img_b_log - D_b_log2;

D_r3 = ifft2(Rfft1.*efft3);
D_g3 = ifft2(Gfft1.*efft3);
D_b3 = ifft2(Bfft1.*efft3);
D_r_log3 = log(D_r3 + 1);
D_g_log3 = log(D_g3 + 1);
D_b_log3 = log(D_b3 + 1);
R3 = img_r_log - D_r_log3;
G3 = img_g_log - D_g_log3;
B3 = img_b_log - D_b_log3;

R = 0.1*R1 + 0.4*R2 + 0.5*R3;
G = 0.1*G1 + 0.4*G2 + 0.5*G3;
B = 0.1*B1 + 0.4*B2 + 0.5*B3;


%ANTILOG OF THE RGB PLANES
R = exp(R);
R = (R - min(R(:)))/(max(R(:)) - min(R(:)));

G = exp(G);
G = (G - min(G(:)) )/(max(G(:)) - min(G(:)));

B = exp(B);
B = (B - min(B(:)))/(max(B(:)) - min(B(:)));
%disp(size(R))

output_img = cat(3, R, G, B);