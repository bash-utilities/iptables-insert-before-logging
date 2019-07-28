#!/usr/bin/env bash


## Translates things such as;
##
##     -A OUTPUT -p tcp -j some_chain
##     -t nat -A POSTROUTING -p udp --dport 53 -j another_chain
##
## To something like;
##
##     iptables -I 5 OUTPUT -p tcp -j some_chain
##     iptables -t nat -I 42 POSTROUTING -p udp --dport 53 -j another_chain
##
## Provided that first logging chain for OUTPUT was found at line four
##  and that perhaps the last line in POSTROUTING was fourty one.
iptables_insert_before_logging(){    ## iptables_insert_before_logging (<args>)
    local _rule_args=("${@:?Parameter_Error: ${FUNCNAME[0]} not provided any arguments}")

    case "${_rule_args[*]}" in
        '-t '*|'--table '*)    local _chain_name="${_rule_args[3]}"    ;;
        *)                     local _chain_name="${_rule_args[1]}"    ;;
    esac

    local _line_number="$(iptables -L "${_chain_name}" -v --line-numbers | awk '/log/{print $1}' | head -1)"
    if ! [ -n "${_line_number}" ]; then
        local _last_line_number="$(iptables -L ${_chain_name} -v --line-numbers | awk 'END {print $1}')"
        _line_number="$(( 1 + ${_last_line_number:-0} ))"
    fi

    case "${_rule_args[*]}" in
        '-t '*|'--table '*)
            local _check_args=("${_rule_args[@]:0:1}" '-C' "${_rule_args[@]:3}")
            local _delete_args=("${_rule_args[@]:0:1}" '-D' "${_rule_args[@]:3}")
            local _insert_args=("${_rule_args[@]:0:1}" '-I' "${_chain_name}" "${_line_number}" "${_rule_args[@]:4}")
        ;;
        *)
            local _check_args=('-C' "${_rule_args[@]:1}")
            local _delete_args=('-D' "${_rule_args[@]:1}")
            local _insert_args=('-I' "${_chain_name}" "${_line_number}" "${_rule_args[@]:2}")
        ;;
    esac
    iptables "${_check_args[@]}" 1>/dev/null 2>&1 && iptables "${_delete_args[@]}"
    iptables "${_insert_args[@]}"
    return "${?}"
}
