module Filters

export Filter, new_Filter

mutable struct Filter
    prev_state::ComplexF64
end

function (filter::Filter)(input_value::ComplexF64; coeff::ComplexF64=0.0im)::ComplexF64
    filter.prev_state = input_value + coeff * filter.prev_state
end

function compute_coeff(normalized_frequency::Float64, nb_sample_damping::Float64)
    return exp(2.0im * pi * normalized_frequency + 1.0 / nb_sample_damping)
end



end # module
