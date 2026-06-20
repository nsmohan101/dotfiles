function pdff --wraps='zathura "$(fd -e pdf | fzf)"' --description 'alias pdff=zathura "$(fd -e pdf | fzf)"'
    zathura "$(fd -e pdf | fzf)" $argv
end
