# Initialize
sec=0

sep=" 󰲅 "

# Update functions
update_cpu() {
    cpu=$(awk '{print $1}' /proc/loadavg)
}

update_memory() {
    memory=$(free -h | awk 'NR==2 {print $3}')
}

update_time() {
    time=$(date "+%b %d %H:%M ")
}

update_network() {
    nint="wlp0s20f3"
    ipv4=$(ip -o -4 a | grep $nint | awk '{print $4}')
    ipv6=$(ip -o -6 a | grep $nint | awk '{print $4}')
    net=""
    if [[ -n $ipv4 ]]; then
        net="  $ipv4"
    elif [[ -n $ipv6 ]]; then
        net="  $ipv6"
    else
        net="󰲜  Disconnected"
    fi
}

update_bat() {
    battery="BAT0"
    if [[ -e /sys/class/power_supply/$battery/status ]]; then
        bat_status=$(< /sys/class/power_supply/$battery/status)
        if [[ -e /sys/class/power_supply/$battery/capacity ]]; then
            bat_capacity=$(< /sys/class/power_supply/$battery/capacity)
            bat="$bat_status $bat_capacity%"
        else
            bat="$bat_status (capacity not available)"
        fi
    fi
}


# Display function
display() {
    status=""
    [[ -n "$net" ]] && status+="$net $sep"
    [[ -n "$bat" ]] && status+="$bat $sep"
    [[ -n "$time" ]] && status+="$time $sep"
    xsetroot -name "$status"
}

# Set up signal handlers
trap "update_bat; display" "RTMIN"

# Initial updates
update_bat

# Main loop
while true; do
    sleep 1
    sec=$((sec + 1))
    case $((sec % 60)) in
        0) update_bat;;
        [1-5])
            update_network
            update_cpu
            update_time
            display
            ;;
    esac
done

