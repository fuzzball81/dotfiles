set -gx PATH $PATH /usr/bin
switch (uname)
	case Linux
		set -gx PATH $PATH /usr/local/sbin

	case Darwin
		test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
		set -gx PATH $PATH {$HOME}/Library/Python/2.7/bin /usr/local/bin
		set -gx VIRTUALFISH_HOME {$HOME}/virtualenvs
end

eval (python -m virtualfish auto_activation compat_aliases)
