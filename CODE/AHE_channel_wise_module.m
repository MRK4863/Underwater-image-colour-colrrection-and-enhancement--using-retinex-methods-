function [o_img] = AHE_channel_wise_module(img, eps)


%MEAN VALUE OF CHANNEL
i_c_mean = mean(img(:));
disp(i_c_mean);

%SIZE OF CHANNEL
img_size  = size(img);

%CONTAINER FOR OUTPUT PROCESSED AHE IMAGE (INITIALIZED TO 0)
o_img = zeros(img_size);

%CUSTOM AHE FOR UNDERWATER IMAGES
%PIECEWISE LINEAR FUNCTION
for i=1:img_size(1)
    for j=1:img_size(2)
        cp = img(i,j);
        if(cp<i_c_mean - eps)
            temp = 100*cp/(i_c_mean - eps);
        else
            if(cp>=(i_c_mean-eps) && cp<=(i_c_mean+eps))
                temp = cp - i_c_mean + 120;
            else
                temp = (115*(cp - i_c_mean - eps)/(235 - i_c_mean)) + 130;
            end
        end
        o_img(i,j) = temp;
    end
end

