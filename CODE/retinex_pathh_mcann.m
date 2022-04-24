function o_img = retinex_path_mcann(img)

img_hsv = rgb2hsv(img);

retinex = retinex_mccann99(img_hsv(:,:,3),4);

retinex = imadjust(retinex,[min(retinex(:)), max(retinex(:))]);

img_hsv_enhanced = cat(3, img_hsv(:,:,1), img_hsv(:,:,2), retinex);
o_img = hsv2rgb(img_hsv_enhanced);