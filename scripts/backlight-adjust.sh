#!/bin/bash
increment=5
fine_increment=1
threshold=20

if [ "$1" = "decrease" ]
then
  threshold=21
fi

if (( $(printf "%.0f\n" "$(light)") < $threshold ))
then
  increment=$fine_increment
fi

increase() {
  light -A $increment
  echo $(light)
}

decrease() {
  light -U $increment
  echo $(light)
}

case "$1" in
  increase)
    increase
    ;;
  decrease)
    decrease
    ;;
esac
