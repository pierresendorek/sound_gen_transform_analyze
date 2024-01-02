include("./oscillators.jl")

using WAV
using .Oscillators


fs = 44100

x = zeros(fs * 2,1)

osc = Osc()

x_complex = convert(Array{ComplexF64,2},x)
y_complex = zeros(ComplexF64, size(x_complex)[1] * 2, size(x_complex)[2])


for i in 1:size(x_complex)[1]
    x_complex[i] = osc(440.0 / fs)
end


y = convert(Array{Float32}, real(x_complex))

wavwrite(y, "/home/pierre/transformed.wav", Fs=fs)




