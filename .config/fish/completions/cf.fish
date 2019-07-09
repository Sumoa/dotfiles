## Utility functions to gather data
function __fish_cf_apps
    env CF_COLOR=false CF_TRACE=false cf apps | awk 'NR>4{print $1}'
end

function __fish_cf_orgs
    env CF_COLOR=false CF_TRACE=false cf orgs | awk 'NR>3{print $1}'
end

function __fish_cf_spaces
    env CF_COLOR=false CF_TRACE=false cf spaces | awk 'NR>3{print $1}'
end


## Utility functions for completion
function __fish_cf_needs_command
  set -l cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'cf' ]
    return 0
  end
  return 1
end

function __fish_cf_using_command
  set -l cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if contains -- $cmd[2] $argv
      return 0
    end
  end
  return 1
end

## General options
complete -c cf -f -d 'The cloudfoundry cli'
complete -c cf -f -n 'not __fish_cf_needs_command' -s h -l help -d 'Display the manual of a cf command' 
complete -c cf -f -n 'not __fish_cf_needs_command' -s v -d 'Print API request diagnostics to stdout'

# Before getting started
complete -c cf -f -n '__fish_cf_needs_command' -a config -d 'Write default values to the config'
complete -c cf -f -n '__fish_cf_needs_command' -k -a 'login l' -d 'Login to cf'
complete -c cf -f -n '__fish_cf_needs_command' -k -a 'target t' -d 'Set or view the targeted org or space'
complete -c cf -f -n '__fish_cf_needs_command' -k -a 'help h' -d 'Show the help dialog'
complete -c cf -f -n '__fish_cf_needs_command' -k -a 'logout lo' -d 'Logout of cf'

## config
complete -c cf -f -n '__fish_cf_using_command config' -l async-timeout -d 'Timeout for async HTTP requests'
complete -c cf -f -n '__fish_cf_using_command config' -l color -d  'Enable or disable color'
complete -c cf -f -n '__fish_cf_using_command config' -l locale -d 'Set default locale. If LOCALE is \'CLEAR\', previous locale is deleted'
complete -c cf -f -n '__fish_cf_using_command config' -l trace -d 'Trace HTTP requests'

## login
complete -c cf -f -n '__fish_cf_using_command l login' -s a -d 'API endpoint (e.g. https://api.example.com)'
complete -c cf -f -n '__fish_cf_using_command l login' -s o -d 'Org'
complete -c cf -f -n '__fish_cf_using_command l login' -s p -d 'Password'
complete -c cf -f -n '__fish_cf_using_command l login' -s s -d 'Space'
complete -c cf -f -n '__fish_cf_using_command l login' -s u -d 'Username'
complete -c cf -f -n '__fish_cf_using_command l login' -l skip-ssl-validation -d 'Skip verification of the API endpoint. Not recommended!'
complete -c cf -f -n '__fish_cf_using_command l login' -l sso -d 'Prompt for a one-time passcode to login'
complete -c cf -f -n '__fish_cf_using_command l login' -l sso-passcode -d 'One-time passcode'

## target
complete -c cf -f -n '__fish_cf_using_command t target' -s o -d 'Organization'
complete -c cf -f -n '__fish_cf_using_command t target' -s s -d 'Space'
complete -c cf -f -n '__fish_cf_using_command t target && __fish_contains_opt -s s' -a '(__fish_cf_spaces)'
complete -c cf -f -n '__fish_cf_using_command t target && __fish_contains_opt -s o' -a '(__fish_cf_orgs)'


# Application lifecycle



#complete -c cf -f -n '__fish_cf_needs_command' -a 'ssh apps app target t sa stop start restart restage'

#complete -c cf -f -n '__fish_seen_subcommand_from t target' -s 's' -a '(__fish_cf_spaces)' -d 'Select space'
#complete -c cf -f -n '__fish_seen_subcommand_from t target' -s 'o' -a '(__fish_cf_orgs)' -d 'Select orgs'
#complete -c cf -f -n '__fish_seen_subcommand_from t target' -a '-s -o'
#complete -c cf -f -n '__fish_seen_subcommand_from -s' -a '(__fish_cf_spaces)'

#complete -c cf -f -n '__fish_seen_subcommand_from ssh restart stop start restage app' -a '(__fish_cf_apps)'
