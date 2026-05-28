#!/bin/bash

# Usage:
# oco.sh <BUY|SELL> <SYMBOL> <LIMIT_TRIGGURE> <STOP_TRIGGURE> <STOP_PRICE_LIMIT>

usage(){
  echo "Usage: $0 <BUY|SELL> <SYMBOL> <LIMIT_PRICE_TRIGGURE> <STOP_PRICE_TRIGGURE> <STOP_PRICE_LIMIT>"
  exit 1
}

if [ $# -ne 5 ]; then
    usage
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/StopLimitChain"

BUYSELL=$1
SYMBOL=$2

LIMIT_TRIGGER=$3
STOP_TRIGGER=$4
STOP_TRIGGER_LIMIT=$5

if [ "$BUYSELL" == "BUY" ]; then
    ORDER1="LIMITBUY"
    ORDER2="STOPBUY"
elif [ "$BUYSELL" == "SELL" ]; then
    ORDER1="LIMITSELL"
    ORDER2="STOPSELL"
else
    usage
fi

("./StopLimitChain.sh" "$ORDER1" "$SYMBOL" "$LIMIT_TRIGGER" - - 100) &
PID1=$!

("./StopLimitChain.sh" "$ORDER2" "$SYMBOL" "$STOP_TRIGGER" - - 100 && "./StopLimitChain.sh" "$ORDER1" "$SYMBOL" "$STOP_TRIGGER_LIMIT" - - 100) &
PID2=$!

# incase CTRL+C make sure all process are killed
trap "pkill -P $PID1 2>/dev/null; pkill -P $PID2 2>/dev/null; exit 1" SIGINT

wait -n

rc=$?

pkill -P $PID1 2>/dev/null
pkill -P $PID2 2>/dev/null

if [ "$rc" -eq 0 ]; then
    exit 0
fi

exit 1