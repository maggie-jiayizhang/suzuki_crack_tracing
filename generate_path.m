function [path, count] = generate_path(img, score, startRow, reward, gap)
    [height, width] = size(score);
    path = zeros(height, width);
    [val, endCol] = max(score(height,:));

    path(height, endCol) = 1;
    col = endCol;
    count = 1;

    for row = height-1:-1:startRow
        cur_score = score(row+1, col);

        if img(row+1, col) == 1
            count = count + 1;
            cur_score = cur_score - reward;
        else
            cur_score = cur_score + gap;
        end
        
        for d = [0, -1, 1]
            if 0 < col+d & col+d < width + 1 & score(row, col+d) == cur_score
                path(row, col+d) = 1;
                a = row;
                col = col+d;
                break;
            end
        end
    end
end