function get_ip_addr --description 'Print the current IP addesss'
	switch (uname)
		case Linux
			set -l interfaces tun0 eth0 enp0s25 wlp3s0
			for val in $interfaces
				set ip (ip address show dev $val | grep inet | grep -v inet6 | awk -F " " '{print $2}' | awk -F "/" '{print $1}')
				break
			end

		case Darwin
			set ip (ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{ print $2 }')
		case '*'
			set ip "Can't get IP"
	end

	echo "$ip"
end

