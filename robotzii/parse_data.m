function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    fid = fopen(filename, "r");

    % TODO 2: Read n, x, y from the file
    n = fscanf(fid, "%d", 1);
    x = fscanf(fid, "%f", [1, n+1]);
    y = fscanf(fid, "%f", [1, n+1]);

    % TODO 3: Close the file
    fclose(fid);
end