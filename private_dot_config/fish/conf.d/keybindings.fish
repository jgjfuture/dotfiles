if status is-interactive
    if test "$TERM_PROGRAM" != "WarpTerminal"
        function fish_user_key_bindings
            fish_default_key_bindings -M default
            fish_default_key_bindings -M insert
            fish_default_key_bindings -M visual
            
            fish_vi_key_bindings --no-erase insert
            
            bind -M insert -m default jj force-repaint

	    # history search
            bind -M insert \cr 'peco_search_history'
            bind -M default / 'peco_search_history'
            bind -M default '?' 'peco_search_history_reverse'
        end
    end
end

