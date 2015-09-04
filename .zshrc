# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git repo)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/gitfast/gitfast.plugin.zsh

# Customize to your needs...
#
# Keep 30000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=30000
SAVEHIST=30000
HISTFILE=~/.zsh_history

BUILDSERVER=myservername

PATH=~/bin:$PATH
#PATH=~/bin/jdk1.6.0_29/bin:$PATH
PATH=~/android-sdks/tools:$PATH
PATH=~/gits/trace-cmd/exec:$PATH
# PATH=/opt/t32/bin:$PATH

export USE_CCACHE=1
export CCACHE_TOOLS_PREFIX="/usr/bin/ccache"
ccache -M 2G > /dev/null
ccache -F 0 > /dev/null

export APPDATA=/tmp

export JAVA_1_5=/usr/java/jdk1.5.0_22

#export JAVA_HOME=$HOME/bin/jdk1.6.0_29
export JAVA_FONTS=/usr/share/fonts/truetype
export ANT_HOME=/usr/share/ant
PATH=$ANT_HOME/bin:$JAVA_HOME/bin:$PATH
export CLASSPATH=.

export PYTHONSTARTUP=~/.pythonrc

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Aliases

alias ls="ls --color=auto"
alias ll="ls -al"
alias gr="grep -nRs"

export NSS_SSL_CBC_RANDOM_IV=0

alias ant-debug-install="android update project -t 17 -p $(pwd) && ant debug install"
alias ant-release-install="android update project -t 17 -p $(pwd) && ant release install"
alias ant-install="android update project -t 17 -p $(pwd) && ant install"

alias enable_alert='PS1="$PS1\a"'

alias systrace='${ANDROID_BUILD_TOP}/external/chromium-trace/systrace.py'
export SYSTRACE_TAGS='sync gfx camera video input webview audio am wm view'
alias systrace_start='systrace -d -f -i -l -t 10 -o trace.html ${SYSTRACE_TAGS}'

stty -ixon

alias adb2fastboot="adb shell setprop sys.adb.config fastboot"
alias as="adb wait-for-device && adb shell"
alias bs="buildserver"
alias aroot="adb wait-for-device && adb root && adb wait-for-device"
alias await="adb wait-for-device"
alias areboot="adb reboot"
alias abootloader="adb wait-for-device && adb reboot bootloader"
alias al="adb logcat -b main -b system -b radio -b events -v threadtime"
alias asmeminfo="adb shell cat /proc/meminfo"
alias ascmdline="adb shell cat /proc/cmdline"
alias asinstalled="adb shell pm list packages"
alias admesg="adb shell cat /proc/kmsg"
alias count="awk 'BEGIN{count=0;} {count+=\$1;} END{print count;}'"
alias countverbose="awk 'BEGIN{count=0;} {count+=\$1;print count;} END{print count;}'"
alias cscope_x86='cscope -b `find ./arch/x86/ ./android/ ./[b-z]*/ -type f`'
alias apull='adb pull'
alias apush='adb push'
alias aremount='adb remount / && adb shell mount -o remount,rw /'
alias smaps2line="awk 'BEGIN{i=0;} {if (i == 0) {addr=\$1; section=\$2; name=\$NF;} else {printf(\"%s %s (%s) (%s)\n\",\$2,name,section,addr);}; i++; i%=2 }' | sort -k1 -n -r"
alias fastbooterasedata='adb reboot bootloader && fastboot erase data && fastboot continue'
alias debug='set -x'
alias akeeproot='while true; do await && aroot && as; done'
alias lsrepos='for i in $(ls -d /mnt/build_server/builds/*/.repo); do name=${i%*.repo}; echo $name; done'
alias lsbuilds='for i in $(lsrepos); do if [ ! -e ${i}out/target/product/ ]; then continue; fi; for j in $(ls ${i}out/target/product/ | grep -v generic); do echo ${i}out/target/product/$j; done; done'
alias smapsview='dos2unix | smaps2line'
alias smapscount='dos2unix | smaps2line | count'
alias graph="geeqie 2>/dev/null"
alias dumpsys_extract_pss="egrep \"(Native Heap|Dalvik Heap|Dalvik Other|Stack|Other dev|.so mmap|.jar mmap|.apk mmap|.ttf mmap|.dex mmap|image mmap|code mmap|Other mmap|Unknown)\" | sed \"s/ Heap/_Heap/g\" | sed \"s/Dalvik Other/Dalvik_Other/g\" | sed \"s/ mmap/_mmap/g\" | sed \"s/Other dev/Other_dev/g\" | awk '{printf(\"%s %s\n\", \$1, \$2)}'"

alias sqlite="sqlitec -nocolour"
alias sqlitec="python -c 'import apsw; apsw.main()'"
alias sql2csv="sed \"s/|/;/g\""

alias kmemleak_read="adb shell cat /d/kmemleak"
alias kmemleak_scan="adb shell 'echo scan > /d/kmemleak'"

# afuse
if [ -d ${HOME}/sshfs ] && [ -z "$(pidof afuse)" ]; then
	pgrep -u ${UID} afuse > /dev/null
	afuse -o timeout=600 -o mount_template="sshfs -o idmap=user %r:/ %m" -o unmount_template="fusermount -u -z %m" ${HOME}/sshfs
fi

# Functions

function set_id {
	#export `adb get-serialno`="$1"
	adb shell "echo $1 > /mnt/sdcard/test_id" >/dev/null 2>&1
}

function get_id {
	serial=$`adb get-serialno 2>/dev/null`
#	local id=`eval echo $serial`

	adb shell touch /mnt/sdcard/test_id 2>/dev/null
	id=`adb shell cat /mnt/sdcard/test_id 2>/dev/null | grep -v "No such file"`
	final_id=`echo $id | sed "s/\\r//g"`

	echo $final_id
}

function aserial {
	local serial=$1
	export ANDROID_SERIAL=$serial
}

function asdrop {
	adb shell "echo 3 > /proc/sys/vm/drop_caches"
}

function asfree {
	while true; do
		sleep 1 2>&1
		mem=`adb shell "cat /proc/meminfo" | egrep "(^MemFree)" | awk '{print $2}' | count`
		echo $mem "kB"
	done;
}

function asfreecached {
	while true; do
		sleep 1 2>&1
		mem=`adb shell "cat /proc/meminfo" | egrep "(^MemFree|^Cached)" | awk '{print $2}' | count`
		echo $mem "kB"
	done;
}

function asdirtied {
	while true; do
		sleep 1 2>&1
		mem=`adb shell "cat /proc/meminfo" | egrep "(^Dirty|^Writeback)" | awk '{print $2}' | count`
		echo $mem "kB"
	done;
}

function build_server {
	cd /mnt/build_server/builds/
	bash
}

function buildserver {

	case $1 in
	build)
		case $2 in
		bootimage)
			build_path=${$3#/mnt/build_server*}
			echo "cd ~$build_path" > /tmp/build.cmds
			echo "exit" >> /tmp/build.cmds
			scp /tmp/build.cmds $BUILDSERVER:~/
			ssh $BUILDSERVER bash ~/build.cmds
		;;
		systemimage)
		;;
		full)
		;;
		*)
			echo "Unsupported"
		esac
	;;
	flash)
		case $2 in
		boot)
			adb reboot bootloader
			fastboot flash boot $3
			fastboot continue
		;;
		system)
			adb reboot bootloader
			fastboot flash system $3
			fastboot continue
		;;
		userdata)
			adb reboot bootloader
			fastboot flash userdata $3
		;;
		flashfiles)
			adb reboot bootloader
            if [ -f $3/userdata.img ]; then
			    fastboot flash userdata $3/userdata.img
            else
                echo "No userdata to flash"
            fi
			fastboot flash system $3/system.img
			fastboot flash boot $3/boot.img
			fastboot continue
			adb wait-for-device
			adb root
			adb wait-for-device
			tmp1=${3%/out/target/product/*}
			tmp2=${tmp1#/mnt/build_server/builds/*}
			set_id $tmp2
		;;
		*)
			echo "Unsupported"
		esac
	;;
	goto)
		cd $2
	;;
	list)
		case $2 in
		builds)
			lsbuilds
		;;
		repos)
			lsrepos
		;;
		*)
			echo "Unsupported"
		esac
	;;
	lunch)
		base=`pwd`
		cd $2 1>/dev/null 2>&1
		. ./build/envsetup.sh 1>/dev/null 2>&1
		lunch $3
		cd $base
	;;
	repo)
		case $2 in
		clean)
			cd $3
			repo forall -c "git clean -xdf"
			make clean
		;;
		*)
			echo "Unsupported"
		esac
	;;
	save)
		build_path=${2#/mnt/build_server*}
		tmp=${build_path%\/*}
		name=${build_path#$tmp/}
		repo=${build_path%/out/target/product/$name}
		repo_path=${repo#/mnt/build_server*}
		target=${repo#/builds/}
		ts=`date +%s`
		echo "#!/bin/sh" > /tmp/build.cmds
		echo "cd ~${repo_path}" >> /tmp/build.cmds
		echo "branch=\`repo branches 2>&1 | grep \"*\" | awk '{print \$2}'\`" >> /tmp/build.cmds
		echo "echo saving \`pwd\`/out in /bignslow/$USER/${ts}_${target}_${name}_\${branch}" >> /tmp/build.cmds
		echo "mkdir /bignslow/$USER/${ts}_${target}_${name}_\${branch}" >> /tmp/build.cmds
		echo "cp -r ./out /bignslow/$USER/${ts}_${target}_${name}_\${branch}" >> /tmp/build.cmds
		scp /tmp/build.cmds $BUILDSERVER:~/
		ssh $BUILDSERVER bash ~/build.cmds
		ssh $BUILDSERVER "rm ~/build.cmds"

	;;
	*)
		echo 'Unsupported'
	esac

}

function asmaps {
adb shell cat /proc/$1/smaps | egrep "(^[0-9a-f]*-|^Pss:)" | sed "s/(deleted)//g"
}

function asdumpsys {
adb shell dumpsys meminfo $1
}

function aspidof {
	adb shell ps | grep $1 | tail -n 1 | awk '{print $2}'
}

function asmaps_shared_dirty {
	adb shell cat /proc/$1/smaps | egrep "(^[0-9a-f]*-|^Shared_Dirty:)"
}


function asmaps_private_dirty {
	adb shell cat /proc/$1/smaps | egrep "(^[0-9a-f]*-|^Private_Dirty:)"
}

function aspss {
	asmaps $1 | dos2unix | smaps2line | count
}

function dotar {
	name=$1
	clean_name=${name%\\}
	ext=${clean_name}.tar.gz

	tar -cvzf ${ext} ${name}
}

function untar {
	name=$1
	noext=${name%\.tar\.gz}
	mkdir $noext
	cd $noext
	tar -xvf ../$name
	cd ..
}

#example : for_each_process "as dumpsys meminfo __process__ > __name__.dumpsys"
function for_each_process {
for process in $(as ps | awk '{print $9}' | sed "s/\r//g"); do name=`echo $process | sed "s/\//_/g"`; tmp=$*; cmd=`echo $tmp | sed "s!__process__!$process!g" | sed "s!__name__!$name!g"`; eval $cmd; done
}
function for_each_pid {
for pid in $(as ps | awk '{print $2}' | sed "s/\r//g"); do tmp=$*; cmd=`echo $tmp | sed "s!__pid__!$pid!g"`; eval $cmd; done
}

function fastscp {
	rsync -avzcu --inplace -e ssh $1 $2
}

function calc {
	echo $(($1))
}

function sleepy {
	for i in $(seq 1 $1); do echo -n "\r$i" ; sleep 1; done
}

function smaps_extract_sections_pss_from_db {
	sqlite -csv $1 "select section.name,sum(pss) from section left join app on app.app_id=section.app_id group by section.name order by sum(pss);"
}

function smaps_extract_sections_private_dirty_from_db {
	sqlite -csv $1 "select app.tag,section.name,sum(private_dirty) from section left join app on app.app_id=section.app_id where perms=\"r-xp\" group by section.name and app.tag order by sum(private_dirty);"
}

function smaps_extract_app_pss_from_db {
	sqlite3 -csv $1 "select app.tag,app.name,section.app_id,sum(pss) from section left join app on app.app_id=section.app_id group by section.app_id;"
}

function fido_prepare_device () {
	adb wait-for-device && adb root && adb wait-for-device
	adb pull /proc/cmdline /tmp/cmdline
	echo "cmdline before edit :"
	cat /tmp/cmdline
	if [ -z "`cat /tmp/cmdline | grep 'earlyprintk=keep'`" ]; then 
		cmdline=`cat /tmp/cmdline`
		extension="earlyprintk=keep,pti"
		echo "$cmdline $extension" > /tmp/cmdline
		adb push /tmp/cmdline /d/osip/cmdline
		adb reboot
		adb wait-for-device
		adb root
		adb wait-for-device
	else
		echo "No need to update cmdline"
	fi
}

function fido_setup () {
	cd ~/Apps/fido.1.9.16_20131209/
	fido &
	fido_prepare_device
}

function fido_listen () {
	cd ~/Apps/mpta_text/
	date=`date +%d_%h_%y_%Hh%Mm%Ss`
	device=`adb get-serialno`
	work_dir=logs/${date}_${device}
	mkdir -p $work_dir
	adb shell "getprop" > $work_dir/getprop.txt
	adb shell "uname -a" > $work_dir/uname.txt
	adb shell "cat /proc/cmdline" > $work_dir/cmdline.txt
	./pti_dumper --fido=7654 | tee $work_dir/traces.txt
}

function do_systrace () {
	emulate bash
	for event in binder/binder_transaction binder/binder_transaction_received;
	do
		adb shell "echo 1 > /d/tracing/events/$event/enable";
	done;

	SYSTRACE=$ANDROID_BUILD_TOP/external/chromium-trace/systrace.py;
	CATS=`python $SYSTRACE -l | sed "s/- .*//;s/^[[:space:]]*//" | tr -d "\n"`;

	echo $CATS
	FNAME=$1
	TIME=$2
	KTRACE=$3
	KTRACE_OPT=""
	if [ ! -z $KTRACE ]; then
		KTRACE_OPT="--ktrace="$KTRACE
	fi
	echo "KTRACE: "$KTRACE_OPT
	python $SYSTRACE -o $FNAME -b 10000 --time=$TIME $KTRACE_OPT $CATS
	emulate zsh
}

function flash_fugu () {
	boot=$1
	system=$2

	fastboot_fugu oem unlock
	fastboot_fugu oem unlock
	fastboot_fugu flash boot $boot
	fastboot_fugu flash system $system
	fastboot_fugu -w
	fastboot_fugu oem lock
	fastboot_fugu continue
}

function stty_read () {
	(stty 115200 cs8 -ixon; cat) < /dev/ttyUSB0
}

function stty_read_dev () {
	(stty 115200 cs8 -ixon; cat) < $1
}

function clock () {
    t_s=0
    while true;
    do
        echo -n "$t_s\r";
        sleep 1;
        t_s=$(($t_s+1))
    done

}
