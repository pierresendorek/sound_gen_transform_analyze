include("./delays.jl")

using WAV
using .Delays


#x, fs = wavread("/home/pierre/example.wav") 

x = zeros(10,1)
x[1] = 1.0

x_complex = convert(Array{ComplexF64,2},x)
y_complex = zeros(ComplexF64, size(x_complex)[1] * 2, size(x_complex)[2])

delay = new_Delay(44100 * 10, 2)


for i in 1:size(x_complex)[1]
    z = x_complex[i]
    z = delay(z, nb_sample_delay=4, feedback=0.9+0.0im)
    y_complex[i] = z
    println(z)
end


#y = convert(Array{Float32}, real(y_complex))

#wavwrite(y, "/home/pierre/transformed.wav", Fs=fs)




