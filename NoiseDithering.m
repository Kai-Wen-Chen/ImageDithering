function img_noise_dithering = NoiseDithering(img)
    [rows, cols] = size(img);
    img_noise_dithering = zeros(size(img));
    
    for i=1:rows
        for j=1:cols
            random_number = randi([0, 255], 1, 1);
            if img(i, j, 1) <= random_number
                img_noise_dithering(i, j, 1) = 0;
            else
                img_noise_dithering(i, j, 1) = 255;
            end
        end
    end
end