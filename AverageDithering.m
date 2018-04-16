function img_average_dithering = AverageDithering(img)
    img_average_dithering = zeros(size(img));
    sum = 0;
    [rows, cols] = size(img);
    
    for i=1:rows
        for j=1:cols
            sum = sum + img(i, j, 1);
        end
    end
    
    average = sum / rows / cols;
    
    for i=1:rows
        for j=1:cols
            if img(i, j, 1) <= average
                img_average_dithering(i, j, 1) = 0;
            else
                img_average_dithering(i, j, 1) = 1;
            end
        end
    end
end