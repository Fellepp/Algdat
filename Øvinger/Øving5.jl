function parse_string(sentence::String)::Array{Tuple{String, Int}}
    splittedList = split(sentence, " ")
    outList = []
    
