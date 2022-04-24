function [o_img] = white_balance(img)

%splitting RGB matrices
i_R = img(:,:,1);
i_G = img(:,:,2);
i_B = img(:,:,3);

i_R = im2double(i_R);
i_G = im2double(i_G);
i_B = im2double(i_B);

max_R = max(i_R(:));
max_G = max(i_G(:));
max_B = max(i_B(:));

i_R = i_R/max_R;
i_G = i_G/max_G;
i_B = i_B/max_B;

i_R = uint8(255 * mat2gray(i_R));
i_G = uint8(255 * mat2gray(i_G));
i_B = uint8(255 * mat2gray(i_B));

o_img = cat(3, i_R, i_G, i_B);
