# Description: A simple sudo command for Windows PowerShell

$command, $params= $args
write-host Starting: $command $params
if ($args.Count -eq 0){
	write-host Usage: sudo command arg arg arg
	exit 0
}
if ($args.Count -eq 1){
	start-process $command -verb runas
}
else {
	start-process $command -verb runas -ArgumentList $params
}