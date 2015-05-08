
export @docstrings, @document

macro options(args...) :(options($(map(esc, args)...))) end
options(; args...) = @compat(Dict{Symbol, Any}(args))

macro docstrings(args...)
    ARGS = esc(:__DOCILE__ARGS__)
    quote
        const $(ARGS) = @options($(map(esc, args)...))
    end
end
macro document(args...)
    ARGS = esc(:__DOCILE__ARGS__)
    quote
        const $(ARGS) = @options($(map(esc, args)...))
    end
end


export @doc_str, @doc_mstr

macro doc_str(text)
    text
end
macro doc_mstr(text)
    Base.triplequoted(text)
end


export @comment, @file_str

macro comment(text)
    [text]
end
macro file_str(text)
    text
end
