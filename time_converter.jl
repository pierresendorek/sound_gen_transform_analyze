

# TODO define types for various time units instead

function normalize_to_seconds(source::Float64, source_unit::Symbol, sampling_frequency::Float64)
    if source_unit == :seconds
        return source
    elseif source_unit == :samples
        return source / sampling_frequency
    elseif source_unit == :hertz
        return 1.0 / source
    elseif source_unit == :bpm
        return 60.0 / source
    end
end


function from_seconds_to_unit(source::Float64, target_unit::Symbol, sampling_frequency::Float64)
    if target_unit == :seconds 
        return source
    elseif target_unit == :samples
        return source * sampling_frequency
    elseif target_unit == :hertz
        return 1.0 / source
    elseif target_unit == :bpm
        return 60.0 / source
    end

end


#=
function time_convert(source,unit_source, unit_target)
    nb_seconds = normalize_to_seconds(source, unit_source)

end
=#

res = normalize_to_seconds(120.0, :bpm, 44100.0)
res2 = from_seconds_to_unit(res, :bpm, 44100.0)

println(res)
println(res2)