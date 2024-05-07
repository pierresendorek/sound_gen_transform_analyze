module Envelope

export XExp

exp_minus_one = exp(-1)

function xexp(time::Float64)::Float64
    return time * exp(-time / xexp.tau) / (xexp.tau * exp_minus_one)
end



end # module