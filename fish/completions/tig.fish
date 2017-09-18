# fish completion for tig


function __fish_tig_no_subcommand
    for i in (commandline -opc)
        if contains -- $i help version
            return 1
	end
    end
    return 0
end


# main
complete -c tig -s v -l version -d 'Show version and exit.'
complete -c tig -s h -l help -d 'Show help message and exit.'

# show
complete -f -c tig -a show -d 'Open diff view using the given git-show(1) options.'

# blame
complete -f -c tig -a blame -d 'Show given file annotated by commits. Takes zero or more git-blame(1) options. Optionally limited from given revision.'

# status
complete -f -c tig -a status -d 'Start up in status view.'

# log
complete -f -c tig -a log -d 'Start up in log view, displaying git-log(1) output.'

# refs
complete -f -c tig -a refs -d 'Start up in refs view.'

# stash
complete -f -c tig -a stash -d 'Start up in stash view.'

# grep
complete -f -c tig -a grep -d 'Open the grep view. Supports the same options as git-grep(1).'

