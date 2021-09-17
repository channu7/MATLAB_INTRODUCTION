im=rgb2gray(imread('image.jpg'));
imshow(im)
  hold on
  
im2=imbinrize(im,graythresh(im));
imshow(im2)
  
im2=~im2;
imshow(im2)
  hold on 
  
B=bwboundries(im2)
  imshow(B)
  
text(100,10,strcat('\color{red}Objects Found:',num2str(length(B))))  
  hold on
