lock := false

; Middle button toggles the lock
MButton:: {
    global lock
    if lock {
        lock := false
        Send("{LButton up}") ; Finalize the selection
    } else {
        Send("{LButton down}") ; Start the selection
        lock := true
    }
}

; Use $ to intercept the click and prevent it from reaching the app
$LButton:: {
    global lock
    if lock {
        ; If we are locked, clicking LButton simply ends the lock 
        ; and "swallows" the click so the highlight isn't lost.
        lock := false
        Send("{LButton up}")
    } else {
        ; Otherwise, behave like a normal mouse button
        Send("{LButton down}")
        KeyWait "LButton"
        Send("{LButton up}")
    }
}

