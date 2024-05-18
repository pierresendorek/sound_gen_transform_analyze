include("filters.jl")

using .Filters





nb_pairs = 10

N = 2 * nb_pairs

a = 0.5

roots = zeros(Complex, N)
amplitudes = zeros(Complex, N)

for k = 1:N
    
     root = a * exp(1.0im * (2 * k - 1) * pi / N)
     amplitude = 1.0

     if abs(root) > 1.0
        root = 1 / root
        amplitude = 1.0 / root * 
     end

     roots[k] = root
end



println(roots)