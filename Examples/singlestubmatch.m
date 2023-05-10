% script matrix1

% 500MHz - 1.5GHz
sweeppoints = 900e+6:10e+6:1100e+6;

% port impedance
Z0 = 50 + 0j


S11dBplot = []
S11realplot = []
S11imagplot = []
Z11realplot = []
Z11imagplot = []
Y11realplot = []
Y11imagplot = []

% common functions
addpath("../ABCDmatrix")


for fp = 1:length(sweeppoints)
    f = sweeppoints(fp)

    
    Mo = TLineMatrix(Z0, (f2rad(f, 1.0e+9)) * 0.58)
    Mo = Mo * ParallelImpedanceMatrix(3e12)

    M = OrthogonalMatrix(Mo)
    M = M * TLineMatrix(Z0, (f2rad(f, 1.0e+9)) * 0.14)
    M = M * SeriesImpedanceMatrix(29.76)
    M = M * ParallelImpedanceMatrix(CapacitorImpedance(20.793e-12, f))

    %% Isolation from Port2
    M = M * SeriesImpedanceMatrix(3e12)

    S = abcd2s(M, Z0)
    Z = abcd2z(M)
    Y = abcd2y(M)

    S11dBplot = [S11dBplot; 20*log10(abs(S(1,1)))]
    S11realplot = [S11realplot; real(S(1,1))]
    S11imagplot = [S11imagplot; imag(S(1,1))]
    Z11realplot = [Z11realplot; real(Z(1,1))]
    Z11imagplot = [Z11imagplot; imag(Z(1,1))]
    Y11realplot = [Y11realplot; real(Y(1,1))]
    Y11imagplot = [Y11imagplot; imag(Y(1,1))]

end

subplot(3, 3, 1)
plot(sweeppoints, S11dBplot)
xlabel("f(Hz)");
ylabel("S1,1(dB)");

subplot(3, 3, 2)
plot(sweeppoints, S11realplot)
xlabel("f(Hz)");
ylabel("S1,1 real");

subplot(3, 3, 3)
plot(sweeppoints, S11imagplot)
xlabel("f(Hz)");
ylabel("S1,1 imag");

subplot(3, 3, 5)
plot(sweeppoints, Z11realplot)
xlabel("f(Hz)");
ylabel("Z1,1 real (ohm)");

subplot(3, 3, 6)
plot(sweeppoints, Z11imagplot)
xlabel("f(Hz)");
ylabel("Z1,1 imag (ohm)");

subplot(3, 3, 8)
plot(sweeppoints, Y11realplot)
xlabel("f(Hz)");
ylabel("Y1,1 real (mho)");

subplot(3, 3, 9)
plot(sweeppoints, Y11imagplot)
xlabel("f(Hz)");
ylabel("Y1,1 imag (mho)");

pause()
