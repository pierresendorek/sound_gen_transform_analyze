module Delay
export DelayState, new_DelayState, delay_rt

using WAV


mutable struct DelayState
    memory::Matrix{ComplexF64}
    current_sample_index::Int64
end


function index(delay_state, i::Int64)::Int64
    return 1 + mod(i - 1, size(delay_state.memory)[1])
end


function new_DelayState(max_nb_samples, channels)::DelayState
    memory = zeros(ComplexF32, max_nb_samples, channels)
    return DelayState(memory, 1)
end


function delay_rt(delay_state::DelayState, curr_value::ComplexF64; delay_value::Int64=1, feedback::ComplexF64=0.0+0.0im)::ComplexF64
    v = curr_value + feedback * delay_state.memory[index(delay_state, delay_state.current_sample_index - delay_value)]
    delay_state.memory[index(delay_state, delay_state.current_sample_index)] = v
    delay_state.current_sample_index += 1
    return v
end



end # module


