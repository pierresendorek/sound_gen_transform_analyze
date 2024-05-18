include("filters.jl")

using .Filters


export ButterworthFilter, new_ButterworthFilter

mutable struct ButterworthFilter
   filters::Array{Filter,1}
   roots::Array{Complex,1}
   amplitudes::Array{Complex,1}
end


function new_ButterworthFilter(nb_pairs::Int64, a::Float64)
   N = 2 * nb_pairs
   roots = zeros(Complex, N)
   amplitudes = zeros(Complex, N)
   filters = Array{Filter,1}(undef, N)

   for k = 1:N
      root = a * exp(1.0im * (2 * k - 1) * pi / N)
      amplitude = 1.0

      if abs(root) > 1.0
         new_root = 1 / conj(root)
         amplitude = 1 / abs(root)
         # TODO? Additional phase shift (see markdown documentation)    
         root = new_root
      end
      roots[k] = root
      amplitudes[k] = amplitude
      filters[k] = Filter(0.0 + 0.0im)
   end

   return ButterworthFilter(filters, roots, amplitudes)
end

function (butterworth::ButterworthFilter)(input_value::ComplexF64)::ComplexF64
   output_value = input_value
   for k = 1:length(butterworth.filters)
      output_value = butterworth.amplitudes[k] * butterworth.filters[k](output_value, coeff=butterworth.roots[k])
   end
   return output_value
end


