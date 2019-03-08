function fish_prompt
	if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

	set skeleton_prompt "["			"\$whoami" 			\
						"@" 		"\$prompt_hostname" \
						" " 		"\$prompt_pwd" 		\
						"]" 		"\$ "

	set prompt_colors 	"red" 		"yellow" 			\
						"green"		"blue" 				\
						"normal" 	"purple" 			\
						"red" 		"grey"

	set prompt_size (count $skeleton_prompt)

	set_color -o normal
	for i in ( seq $prompt_size )
			set_color -o $prompt_colors[$i]
			set sub_prompt $skeleton_prompt[$i]
			if test ( echo $sub_prompt | cut -c 1 ) = "\$";
				set -l sub_command ( echo $sub_prompt | cut -c 2- )
				set sub_command_output (eval $sub_command)
				printf "%s" $sub_command_output
			else
				printf "%s" $sub_prompt
			end
	end


  	# Do nothing if not in vi mode
  	if test "$fish_key_bindings" = "fish_vi_key_bindings"
       or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
       	switch $fish_bind_mode
            case default
    			set_color red
            case insert
                set_color grey
            case replace-one
                set_color green
            case visual
                set_color magenta
        end
		printf '$'
        set_color normal
		printf ' '
    end


    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end


end
