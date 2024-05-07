module TimeConverter

# TODO define types for various time units instead

fq_A4 = 440.0

function normalize_to_seconds(source::Float64, source_unit::Symbol, sampling_frequency::Float64)
    if source_unit == :seconds
        return source
    elseif source_unit == :samples
        return source / sampling_frequency
    elseif source_unit == :hertz
        return 1.0 / source
    elseif source_unit == :bpm
        return 60.0 / source
    elseif source_unit == :note
        # 0.0 is the reference note A4
        return 1.0 / (fq_A4 * 2.0^(source / 12.0))

    end
end

# y = 1 / (fq_A4 * 2^(x / 12))
# 1 / y = fq_A4 * 2^(x / 12)
# 1 / (y * fq_A4) = 2^(x / 12)
# log2(1 / (y * fq_A4)) = x / 12
# 12 * log2(1 / (y * fq_A4)) = x
# - 12 * log2(y * fq_A4) = x


function from_seconds_to_unit(source::Float64, target_unit::Symbol, sampling_frequency::Float64)
    if target_unit == :seconds 
        return source
    elseif target_unit == :samples
        return source * sampling_frequency
    elseif target_unit == :hertz
        return 1.0 / source
    elseif target_unit == :bpm
        return 60.0 / source
    elseif target_unit == :note
        return - 12.0 * log2(source * fq_A4)
    end
end



function time_convert(source, unit_source, unit_target, sampling_frequency)
    nb_seconds = normalize_to_seconds(source, unit_source, sampling_frequency)
    return from_seconds_to_unit(nb_seconds, unit_target, sampling_frequency)
end

end # module
