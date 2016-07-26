function fish_prompt --description 'Write out the prompt'

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_normal
		set -g __fish_prompt_cyan (set_color -o cyan)
		set -g __fish_prompt_yellow (set_color -o yellow)
		set -g __fish_prompt_magenta (set_color -o magenta)
		set -g __fish_prompt_red (set_color -o red)
		set -g __fish_prompt_blue (set_color -o blue)
		set -g __fish_prompt_green (set_color -o green)
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_prompt_user
		set -g __fish_prompt_user $__fish_prompt_yellow"$USER"
	end
	if not set -q __fish_prompt_host
		set -g __fish_prompt_host "$__fish_prompt_green@"(hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_third
		set __prompt $__fish_prompt_normal"-> "
		set -g __fish_prompt_third "$__prompt"
	end

	if not set -q __fish_prompt_ip
		set -g __fish_prompt_ip (get_ip_addr)
	end

	switch $USER
		case root

			if not set -q __fish_prompt_cwd
				if set -q fish_color_cwd_root
					set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
				else
					set -g __fish_prompt_cwd (set_color -o red)
				end
			end

		case '*'
			set __time $__fish_prompt_cyan(date +"(%a %b %d)(%H:%M:%S)")
			set __fish_prompt_first "$__fish_prompt_user$__fish_prompt_host($__fish_prompt_ip)$__time"

			set __pwd $__fish_prompt_red"["(prompt_pwd)"]"
			set __vcs $__fish_prompt_magenta(__fish_vcs_prompt)
			set __fish_prompt_second "$__pwd$__vcs"

			echo ""
			echo $__fish_prompt_first
			echo $__fish_prompt_second
			echo -n $__fish_prompt_third
	end
end
