#!/usr/bin/env bash
source $BIOBASH_HOME/lib/shml/shml.sh

feedback::saythis()
{
  RED='\033[0;31m'
  PURPLE='\033[0;35m'
  GREEN='\033[0;32m'
  CYAN='\033[0;36m'
  BLUE='\033[0;34m'
  YELLOW='\033[0;33m'
  NC='\033[0m' # No Color	

if [ $2 = "error" ]; then
  color=$PURPLE
elif [ $2 = "warn" ]; then 
  color=$YELLOW 
elif [ $2 = "msg" ]; then 
  color=$BLUE
elif [ $2 = "success" ]; then 
  color=$GREEN
 else
   color=$NC
fi

  echo ""
  printf " ${CYAN}Message from: $0 ${NC}"
  echo ""
  printf " ${color}$1 ${NC}"
  echo ""
  echo ""

  echo "SAYING WITH SHML:"
echo $(fgcolor yellow "Message from: $0") $(fgcolor end)
echo $(bgc green yellow "$1") $(bgc end)
}

