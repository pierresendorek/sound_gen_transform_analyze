

nb_pairs = 10

N = 2 * nb_pairs

a = 0.5

roots = zeros(Complex, N)

for k = 1:N
    roots[k] = a * exp(1.0im * (2 * k - 1) * pi / N)
end

println(roots)