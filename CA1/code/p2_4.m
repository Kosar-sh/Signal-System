function [alpha , beta]=p2_4(x,y)
init_Params = [0, 0];
[optimal] = fminunc(@(params) sum((y - (params(1) * x + params(2))).^2), init_Params);
alpha = optimal(1);
beta = optimal(2);
end



