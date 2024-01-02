module Oscillators

export Osc


mutable struct Osc
    memory::ComplexF64
end

# default constructor
Osc() = Osc(1.0 + 0.0im)

#=
mutable struct SawtoothOsc
    memory::Osc
end
=#

function (osc::Osc)(normalized_frequency::Float64)::ComplexF64
    v = osc.memory
    osc.memory *= exp(2.0im * pi * normalized_frequency)
    return v
end



end # module
