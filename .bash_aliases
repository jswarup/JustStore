
alias xplr='explorer '

alias cwssh='ssh jyoti@192.168.1.14'

alias cwjbin='export PATH=$HOME/jbin:$PATH'

function chdir()
{
	old=$PWD
	alias old="echo $old; cd $PWD"
	''cd   $1 > /dev/null
	PS1="${HOSTNAME%%.*}: `basename $PWD` # "
}

alias cd=chdir

function title()
{
    echo -ne "\033]0;${1}\007"
}

function pd()
{
	export $1=$PWD 
	alias  $1="cd $PWD"
}

function pdp()
{
    export $1=$PWD 
    alias  $1="cd $PWD"
    echo "export $1=$PWD " >> ~/.pdp
    echo "alias $1='cd $PWD'" >> ~/.pdp
}

function oldpathsetup()
{
    export PATH=$OLD_PATH
    export LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
}

function pathsetup()
{
    export PATH=$HOME/local/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH
}
function vc()
{
	code -r $* 2> /dev/null
}

function gcc6setup()
{
    export	PATH=".:$HOME/bin:$HOME/bin/gcc-6/bin:$HOME/bin/binutils-2.29/bin:/home/jyoti/bin/gdb-8.0/bin:$PATH:/opt/maven/bin"
    export	LD_LIBRARY_PATH="$HOME/bin/gcc-6/lib64:$HOME/bin/gcc-6/lib:$HOME/bin/binutils-2.29/lib:$LD_LIBRARY_PATH" 
}

function gcc7setup()
{
    export	PATH=".:$HOME/bin:$HOME/bin/gcc-7/bin:$HOME/bin/binutils-2.29/bin:/home/jyoti/bin/gdb-8.0/bin:$PATH:/opt/maven/bin"
    export	LD_LIBRARY_PATH="$HOME/bin/gcc-7/lib64:$HOME/bin/gcc-7/lib:$HOME/bin/binutils-2.29/lib:$LD_LIBRARY_PATH" 
}

function dpdksetup()
{
	export XD_HRADPDK=1
	export RTE_SDK=/home/jyoti/Packs/tics_dpdk-16.07.gcc7
}

function dpdkdbgsetup()
{
	export XD_HRADPDK=1
 	export EXTRA_CFLAGS='-O0 -g'
	export RTE_SDK=/home/jyoti/Packs/tics_dpdk-16.07.dbg
}


function hoardex()
{
 	( export LD_PRELOAD=$bin/libhoard.so; $*)
}

alias l='ls -la'
alias lt='ls -lath'
alias h='history'

function gt()
{
   if [ $1.test == ".test" ]
   then 
       gnome-terminal > /dev/null 2>&1 &
   else
       ssh -Y jswarup@$1 gnome-terminal > /dev/null 2>&1 &
   fi
}

function svg()
{
	BASE=`basename $1 .dot`
	SVG=$BASE.svg
	dot -Tsvg $1 > $SVG
}
	
function rl()
{
	readlink -f $1
}

function jkill()
{
    suex kill -9 $*
}

function jsusp()
{
    suex kill -STOP $*
}

function jcont()
{
    suex kill -CONT $*
}

alias kdev='kdevelop > /dev/null 2>&1 &'

export EDITOR=vim
alias np="/C/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"
alias bdiff="/C/Program\ Files\ \(x86\)/Beyond\ Compare\ 3/BCompare.exe"

#alias sshMidas='ssh -X xanadata-noip.ddns.net -l jyoti'
alias sshtarari='ssh -X 193.38.61.190 -l jyoti'


alias qcuinfo='suex qcu64e -nic 1 -info'
alias qcuset='suex qcu64e -nic 1 -set='

alias insdpdk='suex insmod $RTE_SDK/x86_64-native-linuxapp-gcc/kmod/igb_uio.ko'
alias binddpdk='suex $RTE_SDK/tools/dpdk-devbind.py -b igb_uio '

