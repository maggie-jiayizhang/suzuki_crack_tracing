function [score, startRow, startCol] = score_path(img, reward, gap)
    [height, width] = size(img);
    % make a new matrix to keep a record of the scores
    score = zeros(height, width);

    % find start
    startRow = 0; 
    startCol = 0;
    flag = 0;
    for i = 1:height
        for j = 1:width
            if img(i, j) == 1
                startRow = i;
                startCol = j;
                score(i, j) = reward;
                flag = 1;
                break;
            end
        end
        if flag == 1
            break;
        end
    end
    count = 1;

    % start walking
    for row = startRow+1:height
        for col = 1:width
            s_up = score(row-1, col);

            if not (col == width)
                r_up = score(row-1, col+1);
            else
                r_up = 0;
            end

            if not (col == 1)
                l_up = score(row-1, col-1);
            else
                l_up = 0;
            end

            score(row, col) = max([s_up, r_up, l_up]);
            if img(row, col) == 1
                score(row, col) = score(row, col) + reward;
            else
                score(row, col) = score(row, col) - gap;
            end
        end
    end
end