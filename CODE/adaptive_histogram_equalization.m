function [o_img] = adaptive_histogram_equalization(img)

i_R = img(:,:,1);
i_G = img(:,:,2);
i_B = img(:,:,3);

i_R = double(i_R);
i_G = double(i_G);
i_B = double(i_B);
disp(class(img));

eps = 20;

i_R = AHE_channel_wise_module(i_R, eps);
i_G = AHE_channel_wise_module(i_G, eps);
i_B = AHE_channel_wise_module(i_B, eps);

o_img = cat(3, i_R, i_G, i_B); 
o_img = uint8(o_img);