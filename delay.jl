

struct DelayState
    memory::Vector{Float64}
    current_sample_index::Int64
end

function get(nb_sample_backwards, delay_state::DelayState)
    if nb_sample_backwards > size(delay_state.memory)[1]
        error("nb_sample_backwards cannot be greater than size of memory")
    end
    return delay_state.memory[1 + (delay_state.current_sample_index - 1 - nb_sample_backwards) % size(delay_state.memory)[1]]
end

function delay_rt(curr_value, delay_state::DelayState, delay_value)

end


