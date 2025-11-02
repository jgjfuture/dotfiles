function peco_search_history_reverse
    set -l query (commandline)
    set -l selected (history --reverse | cat | peco --query "$query")
    if test -n "$selected"
        commandline -f repaint
        commandline "$selected"
    end
end

