function zaszumiony = zaszumienie(y,s)
    szum = 0.1 * randn(size(y));
    y_z_szumem = y + szum;
    zaszumiony=y_z_szumem;
end