function img_error_diffusion = ErrorDiffusion(img)
    img_ed = img;
    [rows, cols] = size(img);
    
    for i=1:rows
        for j=1:cols
            if img_ed(i, j) < 128
                e = img_ed(i, j);
            else
                e = img_ed(i, j) - 255;
            end
            
            if i < rows
                img_ed(i+1, j) = img_ed(i+1, j) + (7/16) * e;
            end 
            if i > 1 && j < cols
                img_ed(i-1, j+1) = img_ed(i-1, j+1) + (3/16) * e;
            end
            if j < cols
                img_ed(i, j+1) = img_ed(i, j+1) + (5/16) * e;
            end
            if i < rows && j < cols
                img_ed(i+1, j+1) = img_ed(i+1, j+1) + (1/16) * e;
            end
        end
    end
    
    for i=1:rows
        for j=1:cols
            if img_ed(i, j) < 128
                img_ed(i, j) = 0;
            else
                img_ed(i, j) = 255;
            end
        end
    end
    
    img_error_diffusion = img_ed;
end