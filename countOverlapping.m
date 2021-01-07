function overlapping = countOverlapping(c_class)
    ind = find(cellfun(@length, c_class) > 1);
    overlapping = sum(cellfun(@length, c_class(ind)));
end

