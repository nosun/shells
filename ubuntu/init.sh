#!/usr/bin/env bash

# soft update
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

# locale setting
sudo locale-gen zh_CN.UTF-8

# install software
sudo apt-get install vim -y
sudo apt-get install sysv-rc-conf -y
sudo apt-get install iptables-persistent -y
sudo apt-get install git-core -y
sudo apt-get install zsh -y
sudo apt-get install lrzsz -y
sudo apt-get install squid -y

# oh my zsh install
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## 修改 .zshrc 

#ZSH_THEME="nosun"

## 增加 theme 

#local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
#PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}➜W"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
