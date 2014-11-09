function vc_prompt
	set base_prompt (vcprompt -f '%n:%b:%r')
	set patch (vcprompt -f '%p')

	if [ "$base_prompt" != "" ]
		if [ "$patch" != "" ]
			set full_prompt "[$base_prompt$patch]"
		else
			set full_prompt "[$base_prompt]"
		end
	end

	set -g __vc_prompt $full_prompt
end
