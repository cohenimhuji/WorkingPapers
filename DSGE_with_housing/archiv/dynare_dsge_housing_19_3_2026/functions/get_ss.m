function out = get_ss(name, M_, oo_)
    ind = find(strcmp(M_.endo_names, name));
    out = oo_.steady_state(ind);
end