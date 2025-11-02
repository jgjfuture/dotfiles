function peco_search_history
    set -l query (commandline)
    set -l selected (history | cat | peco --layout=top-down --query "$query")
    if test -n "$selected"
        commandline -f repaint
        commandline "$selected"
    end
end

