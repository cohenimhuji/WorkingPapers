function i = get_var_ind(pname)

    global M_ oo_

    i = strmatch(pname,M_.endo_names,'exact');

end
