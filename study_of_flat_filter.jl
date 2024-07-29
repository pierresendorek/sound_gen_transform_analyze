
using Plots

start = 0.0
stop = 1.0
n = 1000

x = [start + (stop - start) * (i - 1) / n for i in 0:n-1]

a = 0.5
fq = 0.1

p = 3



bp = (1 - a) ./ (1 .- a .* exp.(2.0im * pi .* (x .- fq) ))





# abs between 0 and 1 - (1 - a) / (1 + a)
bc = (1 .- bp)
maxbc = 1 - ((1 - a) / (1 + a))


h = (bc ./ maxbc).^p



plot(x, real.(h), label="real")
plot!(x, imag.(h), label="imag")
plot!(x, abs.(h), label="abs")