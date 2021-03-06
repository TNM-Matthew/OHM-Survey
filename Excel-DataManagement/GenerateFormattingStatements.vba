Sub GenerateFormattingStatements()
'For SAS import
'This Sub needs empty sheets named "Labels", "Values", and "Format"

Sheets("Labels").Select
Cells(1, 1).Select
Sheets("Values").Select
Cells(1, 1).Select
Sheets("Format").Select
Cells(1, 1).Select

Sheets("Copy").Select

LastRow = Range("A65000").End(xlUp).Row
LastColumn = Range("ZZ2").End(xlToLeft).Column
Question = ""
Label = ""
Value = ""

For i = 5 To LastColumn + 1
    If Cells(4, i).Value <> Question Then
        If i > 5 Then
            Sheets("Labels").Select
            Selection.Value = Label + ";"
            Selection.Offset(1, 0).Select
            Sheets("Values").Select
            Selection.Value = Value + ";"
            Selection.Offset(1, 0).Select
            Sheets("Format").Select
            Selection.Value = Question + " " + Question + "f."
            Selection.Offset(1, 0).Select
            Sheets("Copy").Select
        End If
    
        Question = Cells(4, i).Value
        Label = "LABEL " + Question + " = """ + Cells(3, i).Value + """"
        Value = " VALUE " + Question + "f " + CStr(Cells(5, i).Value) + " = """ + CStr(Cells(2, i).Value) + """"
    Else
        Value = Value + " " + CStr(Cells(5, i).Value) + " = """ + Cells(2, i).Value + """"
    End If
Next i

End Sub
