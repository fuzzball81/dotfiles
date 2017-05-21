function xfwd --description 'Run x forwarding for MacOS'
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
end
