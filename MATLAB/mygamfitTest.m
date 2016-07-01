for iter = 1:10
    a = mygammafit(repmat([iter iter+1 iter+2], 1, 100000000))
end
