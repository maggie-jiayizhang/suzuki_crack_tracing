function total = get_area(img, lower, upper)
% get the number of pixel of the target label range in img.
% target lable range = lower -> upper (inclusive on both ends)
    total = 0;
    for label = lower: upper
        [r, c] = find(img == label);
        [area, val] = size(r);
        total = total + area;
    end
end