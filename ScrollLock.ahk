ScrollLock::
    toggle := !toggle
    if(toggle)
        send ^#{Right}
    else
        send ^#{Left}
return