set -gx PATH $PATH /usr/bin
switch (uname)
	case Linux
		set -gx PATH $PATH /usr/local/sbin
end
