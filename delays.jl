module Delays

export Delay, new_Delay


mutable struct Delay
    memory::Matrix{ComplexF64}
    current_index::Int64
end

function index(delay_state, i::Int64)::Int64
    return 1 + mod(i - 1, size(delay_state.memory)[1])
end

function new_Delay(max_nb_samples::Int64, channels::Int64)::Delay
    memory = zeros(ComplexF32, max_nb_samples, channels)
    return Delay(memory, 1)
end


function (delay::Delay)(input_value::ComplexF64; nb_sample_delay::Int64=1, feedback::ComplexF64=0.0im)::ComplexF64
    v = input_value + feedback * delay.memory[index(delay, delay.current_index - nb_sample_delay)]
    delay.memory[index(delay, delay.current_index)] = v
    delay.current_index += 1
    return v
end


end # module


