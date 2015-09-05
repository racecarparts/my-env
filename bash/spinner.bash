# ← ↖ ↑ ↗ → ↘ ↓ ↙

# ▁ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃

# ▉▊▋▌▍▎▏▎▍▌▋▊▉

# ▖ ▘ ▝ ▗

# ┤ ┘ ┴ └ ├ ┌ ┬ ┐

# ◢ ◣ ◤ ◥

# ◰ ◳ ◲ ◱

# ◴ ◷ ◶ ◵

# ◐ ◓ ◑ ◒


spinner() {
    local pid=$1
    local delay=0.10
    tput civis;

    #spin=('◢' '◣' '◤' '◥')
    #spin=('▖' '▘' '▝' '▗')
    spin=('◐' '◓' '◑' '◒')
    local PROGRESS_START='◖'
    local PROGRESS_MID='◼︎'
    local PROGRESS_END='◗'
    local PROGRESS_EMPTY='-'
    local PROGRESS_LENGTH=20

    date1=`date +%s`;
    local newTimeStat
    local prevTimeStat=-1

    local TARGET_KEY=$2

    local SPINNER_STAT_FILE_PATH=~/my\-env/stats/spinner.stat

    if [ ! -z $(cat $SPINNER_STAT_FILE_PATH | grep $TARGET_KEY) ]; then
        keyVal=$(cat $SPINNER_STAT_FILE_PATH | grep $TARGET_KEY)
        prevTimeStat=${keyVal#*=}
    fi

    echo " $(date -ur $(($prevTimeStat)) +%H:%M:%S) - previous build time"
    echo
    local percent=0

    while [ $(ps -eo pid | grep $pid) ]; do


        newTimeStat=$((`date +%s` - $date1));
        percent=$(bc -l <<< $(bc -l <<< "scale=2; $newTimeStat/$prevTimeStat")*100)
        echo -ne "\r\b$i" "$(date -ur $newTimeStat +%H:%M:%S) 〖 ${percent%.*}% 〗";
        sleep $delay


        #〖 ◖ ■ ◗〗
        #newTimeStat=$((`date +%s` - $date1));
        #countDecimal=$(bc -l <<< $(bc -l <<< "scale=2; $newTimeStat/$prevTimeStat")*$PROGRESS_LENGTH)
        #count="${countDecimal%.*}"
        #countDiff=$(($PROGRESS_LENGTH-$count))
        #echo ":: countDec: " $countDecimal ", count: " $count ", countDiff: " $countDiff
        #local progressCount=$(printf "%.s$PROGRESS_MID" $(seq 1 $count))
        #local diffCount=$(printf "%.s$PROGRESS_EMPTY" $(seq 0 $countDiff))

        #local progressBar="〖◖〗"
        #echo -ne "\r\b$i" "$(date -ur $newTimeStat +%H:%M:%S) [ $progressCount$diffCount ] "

        #sleep $delay

    done

    # we're done finsh the progress bar
    #if [ $percent -lt 100 ]; then percent=100; fi

    # check if the stat file exists
    if [ ! -e $SPINNER_STAT_FILE_PATH ]; then
        > $SPINNER_STAT_FILE_PATH;
    fi

    local TARGET_KEY=$2
    local VALUE=$newTimeStat

    # create timestat in file to be read and create percentage
    if [ -z $(cat $SPINNER_STAT_FILE_PATH | grep $TARGET_KEY) ]; then
        echo $TARGET_KEY=$VALUE >> $SPINNER_STAT_FILE_PATH
    else
        sed -i.prev "s/\($TARGET_KEY *= *\).*/\1$VALUE/" $SPINNER_STAT_FILE_PATH
    fi

    tput cnorm;
}
