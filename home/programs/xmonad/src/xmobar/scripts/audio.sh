Status=$(pulseaudio-ctl full-status)
Volume=$(cut -d ' ' -f 1 <<<$Status)
Mute=$(cut -d ' ' -f 2 <<<$Status)
Microphone=$(cut -d ' ' -f 3 <<<$Status)

if [[ $Mute == "yes" ]]; then
	Symbol="\xe04f"
else
	if [[ $Volume -le 50 ]]; then
		Symbol="\xe04d"
	else
		Symbol="\xe050"
	fi
fi

if [[ $Microphone == *"yes"* ]]; then
	MicOut="\xe02b"
else
	MicOut="\xe029"
fi

echo "<fc=#db4d65><fn=1>$Symbol</fn></fc> $Volume% <fc=#db4d65><fn=1>$MicOut</fn></fc>"
