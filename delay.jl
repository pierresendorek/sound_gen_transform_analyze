module Delay
export DelayState, new_DelayState, delay_rt

using WAV


mutable struct DelayState
    memory::Matrix{ComplexF64}
    current_sample_index::Int64
end

function get(nb_sample_backwards, delay_state::DelayState)
    
    if nb_sample_backwards >= size(delay_state.memory)[1]
        nb_sample_backwards = size(delay_state.memory)[1]
        
    end
    return delay_state.memory[1 + mod(delay_state.current_sample_index - 1 - nb_sample_backwards, size(delay_state.memory)[1])]
end


function new_DelayState(max_nb_samples, channels)
    memory = zeros(ComplexF32, max_nb_samples, channels)
    return DelayState(memory, 1)
end


function delay_rt(delay_state::DelayState, curr_value::ComplexF64;
    delay_value::Int64=1,
    feedback::ComplexF64=0.0+0.0im)
    delay_state.memory[delay_state.current_sample_index] = curr_value + feedback * get(delay_value, delay_state)
    return delay_state.memory[delay_state.current_sample_index]
end



end # module