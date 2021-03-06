#!/bin/bash

sudo echo ""$(date | awk '{print $4}')" - STARTING CHROOT REINSTALL (output to chroot-stretch.log)"
  rm -f chroot-stretch.log
  # Removing old chroot
  echo "--> [1/2] "$(date | awk '{print $4}')" - REMOVING ANY EXISTING CHROOT "
  sudo schroot --end-session --all-sessions >>chroot-stretch.log 2>&1 
  sudo rm -r /srv/chroot/stretch-amd64-sbuild/ >>chroot-stretch.log 2>&1
  sudo rm /etc/schroot/chroot.d/stretch-amd64-sbuild-* /etc/sbuild/chroot/stretch-amd64-sbuild >>chroot-stretch.log 2>&1
  # Creating new one
  echo "--> [2/2] "$(date | awk '{print $4}')" - INSTALLING FRESH CHROOT "
  sudo sbuild-createchroot --include=nano,iproute2,sudo,eatmydata,ccache,gnupg,gcc,g++,cpp,gcc-6,g++-6,cpp-6,clang,build-essential stretch /srv/chroot/stretch-amd64-sbuild http://deb.debian.org/debian >>chroot-stretch.log 2>&1 
  sudo sbuild-update -udcar stretch-amd64-sbuild >>chroot-stretch.log 2>&1
echo ""$(date | awk '{print $4}')" - CHROOT REINSTALL DONE"


