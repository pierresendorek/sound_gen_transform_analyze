module Oscillators

export Osc, SawtoothOsc


mutable struct Osc
    state::ComplexF64
end


function (osc::Osc)(normalized_frequency::Float64)::ComplexF64
    value = osc.state
    osc.state *= exp(2.0im * pi * normalized_frequency)
    return value
end

# default constructor
#Osc() = Osc(1.0 + 0.0im)


mutable struct SawtoothOsc
    state::Float64
end

function (saw::SawtoothOsc)(normalized_frequency::Float64)::Float64
    value = saw.state
    saw.state = saw.state + normalized_frequency
    if saw.state > 1.0
        saw.state -= 2.0
    end
    return value
end



end # module
