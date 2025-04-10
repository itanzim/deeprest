#!/system/bin/sh

while true; do
  lock_status=$(dumpsys window | grep -E 'mDreamingLockscreen=true|mShowingLockscreen=true')

  if [ -n "$lock_status" ]; then
    for pkg in $(pm list packages -3 | cut -f2 -d:); do
      am force-stop "$pkg"
    done
    sleep 5
  else
    sleep 5
  fi
done
