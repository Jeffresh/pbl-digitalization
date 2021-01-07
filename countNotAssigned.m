function n_not_assigned = countNotAssigned(c_class)
    n_not_assigned = sum(cellfun(@isempty, c_class));

end

