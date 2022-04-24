
function[rle]=rlemain()

I=imread('cameraman.png');
imshow(I);title('original image');
level=graythresh(I);
disp(level);
bw=im2bw(I,level);
figure;imshow(bw);title('binary image');
a=bw'; a=a(:); a=a';
a=double(a);
rle(1)=a(1); m=2; rle(m)=1;
for i=1:length(a)-1
    if a(i)==a(i+1)
        rle(m)=rle(m)+1;
    else
        m=m+1; rle(m)=1;        %dynamic allocation and initialization of next element of rle
    end
end
%display(rle);