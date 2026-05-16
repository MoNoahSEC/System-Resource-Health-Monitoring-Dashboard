# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

LOGFILE="sysmon.log"
HISTORY_FILE="resource_history.csv"

# history header
if [ ! -f "$HISTORY_FILE" ]; then
    echo "Timestamp,CPU%,RAM_Free%,Disk%" > "$HISTORY_FILE"
fi

# إشارة إيقاف محترمة
trap 'echo -e "${RED}Monitor stopped.${NC}"; exit' SIGINT

echo "Starting System Monitor... (Ctrl+C to stop)"
sleep 2

while true; do
    clear
    {
    echo "=============================="
    echo "   System Monitor Dashboard   "
    echo "=============================="
    echo "Time: $(date)"
    echo ""

    echo "--- Uptime ---"
    uptime
    echo ""

    echo "--- CPU Usage ---"
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 "%"}'
    echo ""

    echo "--- RAM Usage ---"
    free -h
    echo ""

    echo "--- Disk Usage ---"
    df -h
    echo ""

    echo "--- Network Info ---"
    ip addr show | grep "inet " | awk '{print $2}'
    echo ""

    echo "--- Checking Services ---"
    for service in sshd nginx mysql; do
        systemctl is-active $service > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}$service: RUNNING${NC}"
        else
            echo -e "${RED}$service: NOT RUNNING${NC}"
        fi
    done
    echo ""

    echo "--- Warnings ---"

    DISK=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
    FREE_RAM=$(free | grep Mem | awk '{print int($4/$2 * 100)}')
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

    # disk
    if [ $DISK -gt 80 ]; then
        echo -e "${RED}WARNING: Disk almost full! ($DISK%)${NC}"
    elif [ $DISK -gt 60 ]; then
        echo -e "${YELLOW}WARNING: Disk getting full ($DISK%)${NC}"
    else
        echo -e "${GREEN}Disk is OK ($DISK%)${NC}"
    fi

    # ram
    if [ $FREE_RAM -lt 20 ]; then
        echo -e "${RED}WARNING: RAM is low! ($FREE_RAM% free)${NC}"
    elif [ $FREE_RAM -lt 40 ]; then
        echo -e "${YELLOW}WARNING: RAM getting low ($FREE_RAM% free)${NC}"
    else
        echo -e "${GREEN}RAM is OK ($FREE_RAM% free)${NC}"
    fi

    # cpu
    if [ $CPU -gt 90 ]; then
        echo -e "${RED}WARNING: CPU very high! ($CPU%)${NC}"
    elif [ $CPU -gt 70 ]; then
        echo -e "${YELLOW}WARNING: CPU is high ($CPU%)${NC}"
    else
        echo -e "${GREEN}CPU is OK ($CPU%)${NC}"
    fi

    # history tracking
    echo "$(date '+%Y-%m-%d %H:%M:%S'),$CPU,$FREE_RAM,$DISK" >> "$HISTORY_FILE"

    echo ""
    echo "=============================="
    echo " Refreshing every 5 seconds..."
    echo " Log: $LOGFILE | History: $HISTORY_FILE"
    echo "=============================="

    } | tee -a "$LOGFILE"

    sleep 5
done
