function o_img = retinex_path_mcann(img)

%img_hsv = rgb2hsv(img);
% figure(10)
% subplot(3,1,1);
% imshow(img_hsv(:,:,1));
% 
% subplot(3,1,2);
% imshow(img_hsv(:,:,2));
% subplot(3,1,3);
% imshow(img_hsv(:,:,3));
% 
% retinex = retinex_mccann99(img_hsv(:,:,3),4);
% retinex = im2double(retinex);
% %retinex = imadjust(retinex,[min(retinex(:)), max(retinex(:))]);
% 
% img_hsv_enhanced = cat(3, img_hsv(:,:,1), img_hsv(:,:,2), retinex);
% 
% o_img = hsv2rgb(img_hsv_enhanced);

img = im2double(img);

retinex_R = retinex_mccann99(log10(img(:,:,1)),4);
retinex_G = retinex_mccann99(log10(img(:,:,2)),4);
retinex_B = retinex_mccann99(log10(img(:,:,3)),4);

retinex_R = 10.^retinex_R;
retinex_G = 10.^retinex_G;
retinex_B = 10.^retinex_B;

% figure;
% subplot(1,3,1);
% plot(imhist(retinex_R));
% 
% subplot(1,3,1);
% plot(imhist(retinex_G));
% 
% subplot(1,3,1);
% plot(imhist(retinex_B));
% 
% 
% retinex_R = imadjust(retinex_R,[min(retinex_R(:)), max(retinex_R(:))]);
% retinex_G = imadjust(retinex_G,[min(retinex_G(:)), max(retinex_G(:))]);
% retinex_B = imadjust(retinex_B,[min(retinex_B(:)), max(retinex_B(:))]);
% 
% figure;
% subplot(1,3,1);
% plot(imhist(retinex_R));
% 
% subplot(1,3,1);
% plot(imhist(retinex_G));
% 
% subplot(1,3,1);
% plot(imhist(retinex_B));

o_img = cat(3, retinex_R, retinex_G, retinex_G);

