include("./envelope.jl")
include("./oscillators.jl")
include("./time_converter.jl")

using WAV
using .Envelope
using .Oscillators
using .TimeConverter







saw = SawtoothOsc(1.0 + 0.0im)

fs = 44100

x = zeros(fs * 3,1)

for i in 1:size(x)[1]

    
    oscillation_frequency = time_convert(0.0, :note, :frequency, 44100)
    x[i] = saw(oscillation_frequency)
end

y = convert(Array{Float32}, x)

wavwrite(y, "/tmp/sawtooth.wav", Fs=fs)

