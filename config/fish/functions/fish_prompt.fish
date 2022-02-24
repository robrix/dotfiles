function fish_prompt
	set -l last_status $status
	set -l colour
	if not test $last_status -eq 0
		set colour $fish_color_error
	else
		set colour magenta
	end
	set -l suffix
	set suffix '❱'

	set_color -b $colour
	set_color -o fff
	printf "%*s\r%s\n" (tput cols) (__fish_git_prompt) (prompt_pwd)
	set_color -b normal
	set_color $colour
	echo -n $suffix
	echo -n ' '
	set_color normal
end
