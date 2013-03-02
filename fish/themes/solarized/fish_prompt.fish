set TERM xterm-256color
set -U fish_color_user 268bd2
set -U fish_color_root dc322f
set -U fish_color_host b58900
set -U fish_color_cwd  859900
set -U fish_color_error d70000
set -U fish_git_branch_color 00afaf

#git
set __fish_git_prompt_color_branch $fish_git_branch_color
set __fish_git_prompt_color_dirtystate $fish_color_user
set __fish_git_prompt_color_stagedstate $fish_color_host
set __fish_git_prompt_color_untrackedfiles $fish_color_cwd
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showuntrackedfiles true

function fish_prompt --description "Write out the prompt"

  #user
  switch $USER
    case root
      set_color $fish_color_root
      printf (whoami)

    case '*'
      set_color $fish_color_user
      printf (whoami)
  end
  set_color normal

  printf " at "

  #host
  set_color $fish_color_host
  printf (hostname -s)
  set_color normal

  printf " in "

  #PWD
  set_color $fish_color_cwd
  printf (prompt_pwd)
  set_color normal

  __fish_git_prompt 

  switch $USER
    case root
      printf "\n# "

    case '*' 
      printf "\n\$ "
  end

  set_color normal

end

