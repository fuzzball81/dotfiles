function get_ip_addr --description 'Print the current IP addesss'
	set -l interfaces tun0 eth0 enp0s25 wlp3s0
	for val in $interfaces
		set ip (ip address show dev $val | grep inet | grep -v inet6 | awk -F " " '{print $2}' | awk -F "/" '{print $1}')
		break
	end

	echo "$ip"
end

