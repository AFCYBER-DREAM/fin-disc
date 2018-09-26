#!/bin/bash

# fin-disc was made to simplify the process of finalizing discs in *Nix systems

# --------VARIABLES
ddrive="/dev/sr0"

# --------FUNCTIONS
function detect_mount {
  if [ "$(mount | grep ${ddrive})" ]; then
    old_mount="$(mount | grep ${ddrive} | cut -d ' ' -f 3)"
    vol_label="$(basename ${old_mount})"
    old_mount="$(dirname ${old_monut})"

    echo "Unmounting ${ddrive} from ${old_mount}/${vol_label}."
    umount ${old_mount}/${vol_label}
  else
    echo "No media detected in ${ddrive}."
    exit 1
  fi
}

function fix_media {
  read -p "Proceed [y/N]: " conf
  conf=${conf:-N}

  if [ ${conf} == "Y" ] || [ ${conf} == "y" ]; then
    echo "Finalizing media in ${ddrive}."
    wodim -f dev=${ddrive}
  elif [ ${conf} == "N" ] || [ ${conf} == "n" ]; then
    echo "Media will remain unfinished."
  else
    echo "Input must be 'y', 'Y', 'n', or 'N'."
    exit 2
 fi
}

function detect_state {
  if [ "$(cdrskin dev=${ddrive} -msinfo 2>/dev/null)" ]; then
    echo "Media in drive ${ddrive} will be fixated."
    fix_media
  else
    echo "Media is blank or finalized."
  fi
}

function remount {
  eject ${ddrive}
  echo "Please reinsert the media to remount the drive."
}

# -------------MAIN
detect_mount
detect_state
remount
