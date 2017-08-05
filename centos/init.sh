#!/bin/bash
yum install git zsh -y
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/nosun.zsh-theme
vi ~/.oh-my-zsh/themes/nosun.zsh-theme

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#change prompt

vi ~/.zshrc
#change nosun
