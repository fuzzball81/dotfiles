set -gx PATH $PATH /usr/bin
switch (uname)
	case Linux
		set -gx PATH $PATH /usr/local/sbin

	case Darwin
		set -gx PATH $PATH {$HOME}/Library/Python/2.7/bin
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
