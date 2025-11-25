# ghq + fzf でリポジトリ選択して移動

ghq-fzf-cd-widget() {
    local selected_dir=$(ghq list --full-path | fzf \
        --prompt="Repository > " \
        --height=80% \
        --reverse \
        --border \
        --preview="
            echo '📁 Directory:' && \
            ls -la --color=always {} && \
            echo '' && \
            echo '📊 Git Status:' && \
            git -C {} status --short && \
            echo '' && \
            echo '📝 Recent Commits:' && \
            git -C {} log --oneline --color=always -10
        " \
        --preview-window=right:60%:wrap \
        --bind='ctrl-/:toggle-preview')
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        # precmd関数を全て実行
        for func in $precmd_functions; do
            $func
        done
    fi
    zle reset-prompt
}

zle -N ghq-fzf-cd-widget
