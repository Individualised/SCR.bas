$Resize:On
$Resize:Stretch
Screen 13
Randomize Timer
Dim TextField(25, 40, 2) As _Unsigned _Bit * 4
Dim Rain(17, 2) As _Unsigned _Bit * 6
'For J = 0 To 24
'    For I = 0 To 39
'        If Rnd > 0.5 Then
'            TextField(J, I, 0) = 1
'        End If
'        TextField(J, I, 1) = J Mod 15
'    Next I
'Next J

While 1
    Cls
    For J = 0 To 24
        For I = 0 To 39
            If TextField(J, I, 1) > 0 Then TextField(J, I, 1) = TextField(J, I, 1) - 1
        Next I
    Next J
    While 1
        T = Int(Rnd * 17)
        If Rain(T, 0) = 0 Then
            Rain(T, 0) = (Int(Rnd * 40) + 1)
        End If
        Exit While
    Wend

    For X = 0 To 16
        If Rain(X, 0) <> 0 Then
            If Rain(X, 1) = 24 Then
                Rain(X, 0) = 0
                Rain(X, 1) = 0
                _Continue
            Else
                Rain(X, 1) = Rain(X, 1) + 1
            End If
            If Rnd > 0.5 Then TextField(Rain(X, 1), Rain(X, 0) - 1, 0) = 1 Else TextField(Rain(X, 1), Rain(X, 0) - 1, 0) = 0
            TextField(Rain(X, 1), Rain(X, 0) - 1, 1) = 15
        End If
    Next X

    For J = 0 To 24
        For I = 0 To 39
            Color _RGB(0, TextField(J, I, 1) * 17, 0)
            Print Right$(Str$(TextField(J, I, 0)), 1);
        Next I
    Next J
    _Display
    _Delay 0.33
Wend


