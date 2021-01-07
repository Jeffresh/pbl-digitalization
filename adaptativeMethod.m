function [centers, classes ,c_class] = adaptativeMethod(X, radius_in, radius_out, visualization)
    
    draw = false;
    if nargin > 2
        draw = visualization;
    end

    n_examples = size(X, 2);
    ind_first = randi(n_examples);
    prototype = X(:, ind_first);
    centers = [ind_first];
    classes = zeros(size(X,1), 1);
    c_class{size(X,2),1} = []; 
    classes(ind_first) = ind_first;
    
    outsiders = zeros(size(X, 1), 1);

    for i=1:length(X)
        if(~ ismember(i, centers))
            example_vect = X(:,i);
            distances = dist_circle(X(:, centers), example_vect);
            [min_dis, class] = min(distances);
            
            cents = distances <= radius_in;
            c_class{i} = [c_class{i}, centers(cents)];
            if (min_dis <= radius_in)
                classes(i) = centers(class);
                
            elseif min_dis < radius_out
                outsiders(i) = 1;
                c_class{i} = 0;
            else
                centers = [centers, i];
                classes(i) = i;
            end
        end
    end
    
    
    if draw
        drawSolution(X, classes, centers)
    end

end