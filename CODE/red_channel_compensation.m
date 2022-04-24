function [o_img] = red_channel_compensation(img, alpha, filt_size)

%alpha
a = alpha;

img_size = size(img(:,:,1));
% disp(img_size);

%splitting RGB matrices
i_R = img(:,:,1);
i_G = img(:,:,2);
i_B = img(:,:,3);



i_G_zero_pad = zeros(img_size+filt_size-1);
i_B_zero_pad = zeros(img_size+filt_size-1);

% disp(size(i_G_zero_pad))

for i=1:img_size(1)
    for j=1:img_size(2)
        i_G_zero_pad((i+floor(filt_size/2)), (j+floor(filt_size/2))) = i_G(i,j);
    end
end

for i=1:img_size(1)
    for j=1:img_size(2)
        i_B_zero_pad((i+floor(filt_size/2)), (j+floor(filt_size/2))) = i_B(i,j);
    end
end

o_R_img = zeros(img_size(1), img_size(2));


for i=1:img_size(1)
    for j=1:img_size(2)
        G_neighbhor = i_G_zero_pad(i:i+(filt_size - 1),j:j+(filt_size - 1));
        B_neighbhor = i_B_zero_pad(i:i+(filt_size - 1),j:j+(filt_size - 1));
        
        G_neighbhor_avg = mean2(G_neighbhor);
        B_neighbhor_avg = mean2(B_neighbhor);
    
        temp_1 = a*G_neighbhor_avg + (1-a)*B_neighbhor_avg - i_R(i,j);
        temp_2 = (a*i_G(i,j) + (1-a)*(i_B(i,j)))/(i_R(i,j) + i_G(i,j) + i_R(i,j));
        o_R_img(i,j) = i_R(i,j) + temp_1*temp_2;
    end
end
        
o_G_img = i_G;
o_B_img = i_B;

% disp(size(o_R_img));
% disp(size(o_G_img));
% disp(size(o_B_img));

o_img = cat(3, o_R_img, o_G_img, o_B_img);
        
        
        