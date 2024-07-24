% read the mri image.

k=imread("images (1).jpeg");

% display the image.

imtool(k,[]);

% convert it into binary image.

k1=im2bw(k,graythresh(k));

% display the binary image.

imtool(k1);

% Make the brain largest connected component.

% We need to apply opening operation.

% define the structuring element.

SE=strel('disk',7,4);
% apply the opening operation.

k2=imopen(k1,SE);
% display the image now.

imtool(k2);
% apply connected component analysis.

b=bwlabel(k2);
% display the colored map image.

imtool(b,[]);
% brain is component labeled as 9.
% set all other component as 0 except brain.
b(b~=9)=0;
% display the brain part.

imtool(b);
% inside the brain part, black portion is there.
% close the black pixels inside brain part.
k3=imclose(b,strel('disk',18));
% display the brain part.

imtool(k3);
% extract the brain from original image.

k4=k3.*double(k);
% display the real brain from original image.

imtool(k4,[]);