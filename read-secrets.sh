#!/bin/bash

env_secret_debug()
{
    if [ ! -z "$ENV_SECRETS_DEBUG" ]; then
        echo -e "\033[1m$@\033[0m"
    fi
}

read-secret()
{
    var_name="$1"
    var_fname="${var_name}_FILE"
    eval fname=\$$var_fname
    if [ -n "$fname" ]; then
	env_secret_debug "Found env var $var_fname = $fname"
	if [ -f $fname ]; then
	    val=$(cat "${fname}")
	    export "$var_name"="$val"
	    env_secret_debug "Slurped value $val into var $var_name from $fname"
	else
	    env_secret_debug "ERROR: file $fname not found"
	fi
    else
	env_secret_debug "File var $var_fname not present"
    fi
}

read-secrets()
{
    for var_name in "$@" ; do
	read-secret $var_name
    done
    env_secret_debug "Read secrets $@"
}

read-secrets $@
