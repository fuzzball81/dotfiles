function fish_prompt --description 'Write out the prompt'

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	switch $USER

		case root

		if not set -q __fish_prompt_cwd
			if set -q fish_color_cwd_root
				set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
			else
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end
		end

		case '*'

		if not set -q __fish_prompt_cwd
			set -g __fish_prompt_cwd (set_color $fish_color_cwd)
		end
	end

	vc_prompt

	echo -n -s -e "\n$USER" @ "$__fish_prompt_hostname\n$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal $__vc_prompt\n> "

end
