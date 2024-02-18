function fish_prompt
  if test $status -eq 0
    set command_succeed 1
  end

  set -g __fish_git_prompt_showdirtystate 1
  set -g __fish_git_prompt_showstashstate 1
  set -g __fish_git_prompt_showupstream auto

  set -g __fish_git_prompt_char_stagedstate " +"
  set -g __fish_git_prompt_char_dirtystate " *"
  set -g __fish_git_prompt_char_stashstate " ≡"
  set -g __fish_git_prompt_char_upstream_ahead " ⇡"
  set -g __fish_git_prompt_char_upstream_behind " ⇣"
  set -g __fish_git_prompt_char_upstream_diverged " ⇡⇣"
  set -g __fish_git_prompt_char_upstream_equal ""

  set -g __fish_git_prompt_color_dirtystate red -o
  set -g __fish_git_prompt_color_stagedstate blue -o
  set -g __fish_git_prompt_color_stashstate cyan -o

  set -g __fish_git_prompt_char_stateseparator ""

  set -g __fish_git_prompt_color_prefix brblack -o
  set -g __fish_git_prompt_color_suffix brblack -o
  set -g __fish_git_prompt_color_branch brblack -o

  set_color green -o
  printf "$(prompt_pwd)"
  set_color normal
  printf (string replace -r -a "\(|\)" "" (fish_git_prompt))

  if test $CMD_DURATION -gt "5000"
    set_color yellow -o
    printf " $(math "floor($CMD_DURATION / 1000)") s"
  end

  if set -q command_succeed
    set_color blue -o
  else
    set_color red -o
  end

  printf "\n❯ "
  set_color normal
end

function add_newline --on-event fish_postexec
   echo
end
