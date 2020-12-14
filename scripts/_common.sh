#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

YNH_PHP_VERSION="7.3"

# dependencies used by the app
pkg_dependencies="wireguard "

#=================================================
# PERSONAL HELPERS
#=================================================


#=================================================
# EXPERIMENTAL HELPERS
#=================================================

# Check the arch
# example: arch=$(ynh_detect_arch)
# usage: ynh_detect_arch
# Requires YunoHost version 2.2.4 or higher.

ynh_detect_arch(){
	#local arch
	if [ -n "$(uname -m | grep arm64)" ] || [ -n "$(uname -m | grep aarch64)" ]; then
		arch="arm64"
		pkg_dependencies="$pkg_dependencies dkms linux-image-4.19.0-11-arm64 linux-image-arm64 wireguard wireguard-dkms"
	elif [ -n "$(uname -m | grep x86_64)" ] || [ -n "$(uname -m | grep amd64)" ]; then
		arch="amd64"
	elif [ -n "$(uname -m | grep 86)" ]; then
		arch="386"
	elif [ -n "$(uname -m | grep arm)" ]; then
		arch="arm"
	else
		arch="unknown"
	fi
	#echo $arch
}


#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
