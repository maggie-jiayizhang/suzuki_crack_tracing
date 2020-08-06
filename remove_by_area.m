function f = remove_by_area(img, L, n, thresh) 
    f = img;
    for k = 1:n 
        [r, c] = find(L==k);
        if size(r) <= thresh
            for j = 1:size(r)
                f(r(j), c(j)) = 0;
            end
        end
    end
end
