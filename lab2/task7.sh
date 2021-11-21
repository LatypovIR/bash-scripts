bytes=()
comms=()

procs=$(ps -eo pid=)

for pid in $procs
do
	dir=/proc/$pid
	if [ ! -e $dir ]
	then
		continue
	fi

	comm=$(tr -d '\0' </proc/$pid/cmdline)
	byte=$(sudo cat /proc/$pid/io | grep -i read_bytes | awk '{print $NF}')
	bytes[$pid]=$byte
	comms[$pid]=$comm
done

sleep 60s

index=0
bytes[0]=0

for pid in $procs
do
	dir=/proc/$pid
	if [ ! -e $dir ]
	then
		continue
	fi

	if [ -z "${bytes[$pid]}" ]
	then
		bytes[$pid]=0
	fi

	byte=$(sudo cat /proc/$pid/io | grep -i read_bytes | awk '{print $NF}')
	let bytes[$pid]=$byte-${bytes[$pid]}

	if [[ "${bytes[$pid]}" -ge "${bytes[$index]}" ]]
	then
		index=$pid
	fi

done

echo "PID=" $index ": COMMAND=" ${comms[$index]} "READ BYTES=" ${bytes[$index]}
