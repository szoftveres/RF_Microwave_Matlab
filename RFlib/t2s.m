function S = t2s(T)
    det = (T(1,1) * T(2,2)) - (T(1,2) * T(2,1));
    S = zeros(2);
    S(1,1) = T(1,2) / T(2,2);
    S(1,2) = det / T(2,2);
    S(2,1) = 1 / T(2,2);
    S(2,2) = -T(2,1) / T(2,2);
end

