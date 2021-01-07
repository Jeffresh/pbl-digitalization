function distance = dist_circle(x, center)
    diff = center - x;
    distance = sqrt(sum(diff .* diff));
end