 x=imread('Brain.jpg'); [long,larg]=size(x);
 for z = 1:7
for i = 1:long
    for j = 1:larg
        if x(i,j) >= 90   x(i,j)=255; end
        if x(i,j)<=1      x(i,j)=255; end
    end
end
x=medfilt2(x); fil(long,larg)=0;
for i = 2:long-1
    for j = 2:larg-1
        k=0;
        if not(x(i,j) == 255) 
            if x(i+1,j)==255   k=k+1; end
            if x(i,j+1)==255   k=k+1; end
            if x(i-1,j)==255   k=k+1; end
            if x(i,j-1)==255   k=k+1; end
            if x(i+1,j+1)==255 k=k+1; end
            if x(i-1,j-1)==255 k=k+1; end
            if x(i+1,j-1)==255 k=k+1; end
            if x(i-1,j+1)==255 k=k+1; end
            if k>=3  fil(i,j)=0; 
            else     fil(i,j)=1;   end    
        end
    end
end 
for i = 1:long
    for j = 1:larg
        if fil(i,j)==0  x(i,j)=255; end
    end      
end
imshow(x);
 end