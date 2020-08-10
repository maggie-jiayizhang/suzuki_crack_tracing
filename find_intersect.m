function result = find_intersect(img_bw, path, L, n)
% Find the area intersecting the marked line, it takes in binarized image,
% marked line, connected components labeling matrix, number of connected components
    % make a copy of L (b/c we will destructively change L)
    L_copy = L;
    % set a sum recorder 
    result = 0;
    % loop over the whole path
    [r, c] = find(path == 1);
    rows = size(r);
    for i = 1 : rows 
        indx = L_copy(r(i), c(i));
        if indx ~= 0
            [area_r, area_c] = find(L_copy==indx);
            [area, val] = size(area_r);
            result = result + area;
            L_copy(L_copy==indx) = 0;
        end
    end
end