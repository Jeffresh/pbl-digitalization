function fig = drawSolution(X, classes, centers, mode)
    
    cent_mode = false;
    if nargin > 3
        mode = 'centroids';
        cent_mode = true;
    end
    
    fig = figure;
        title('Prototipos');
        plot(X(1,:),X(2,:),'.','Color',[0,0,0]),hold on;
        if cent_mode
            for center_i=1:length(centers)
                color = [rand(),rand(),rand()];
                points_class_i = find(classes == center_i);
                plot(X(1,points_class_i),X(2,points_class_i),'o','Color',color,'MarkerFaceColor',color)
                plot(centers(1, center_i), centers(2 ,center_i),'ko','MarkerFaceColor','k')
                pause(0.1);
            end
        
        else
              
            for center_i=1:length(centers)    
                color = [rand(),rand(),rand()];
                points_class_i = find(classes == centers(center_i));
                plot(X(1,points_class_i),X(2,points_class_i),'o','Color',color,'MarkerFaceColor',color)
                plot(X(1,centers(center_i)),X(2,centers(center_i)),'ko','MarkerFaceColor','k')
                pause(0.1);
            end
        end
        

        hold off
        
    
end