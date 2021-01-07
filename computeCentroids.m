function [centroids, classes, c_class] = computeCentroids(X, class, centers, radius_in, radius_ex)
    c_class{size(X,2),1} = []; 
    outsiders = zeros(size(X, 2), 1);


    for i=1:length(centers)
        ind = find(class == centers(i));
        centroids(:, i) = meanpat(X(:, ind));
    end
    
    for i=1:size(centroids, 2)
        d(i,:) = dist_circle(X, centroids(:,i));
        
        points = find(d(i,:) <= radius_in);
        for point=1:length(points)
            values = [unique(cell2mat(c_class(points(point))));i];
            c_class(points(point)) = {values};
        end

    end
    
    
    [~, classes] = min(d);

end

