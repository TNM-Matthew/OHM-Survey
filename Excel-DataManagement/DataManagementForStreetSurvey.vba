Sub DataManagementForStreetSurvey()
'
' Before running this macro:
'   1. Create sheet named "Copy" and copy entire results sheet into it
'   2. Create a blank sheet named "Formatted"
'

'''''''''''''''''''
' PREP DATA
'''''''''''''''''''
Sheets("Copy").Select

'Clean
Range("EC2").Value = "Skip"
Rows(64).Delete Shift:=xlUp

'Copy question text to each column
Rows(3).Select
Selection.Insert
Range("E3").Select
Selection.Formula = "=IF(ISBLANK(E1), D3, E1)"
Selection.AutoFill Destination:=Range("E3:HN3")

'Isolate question number
Rows(4).Select
Selection.Insert Shift:=xlDown
Range("E4").Select
Selection.Formula = "=LEFT(E3, FIND("":"", E3) - 1)"
Selection.AutoFill Destination:=Range("E4:HN4")

'Check All adjustment
Qx = Array("Q4", "Q6a", "Q6b", "Q25")
For i = 1 To Range("ZZ2").End(xlToLeft).Column
    For Each Q In Qx
        If Cells(4, i).Value = Q Then
            Cells(4, i).Value = Q + " " + Cells(2, i).Value
        End If
    Next Q
Next i

'Index responses
Rows(5).Select
Selection.Insert Shift:=xlDown
Range("E5").Select
Selection.Formula = "=IF(E2=""Skip"", 9999, IF(E4=D4, D5+1, 1))"
Selection.AutoFill Destination:=Range("E5:HN5")

'Convert spanish to boolean
For i = 7 To Range("A65000").End(xlUp).Row
    If Cells(i, 4).Value = "no" Then
        Cells(i, 4).Value = 0
    ElseIf Cells(i, 4).Value = "yes" Then
        Cells(i, 4).Value = 1
    End If
Next i
Columns(4).NumberFormat = "0"

'Formatting
Rows(3).RowHeight = 200
Range("A1").Select

'''''''''''''''''''
' CREATE HEADER ROW
'''''''''''''''''''
LastRow = Range("A65000").End(xlUp).Row
LastColumn = Range("ZZ2").End(xlToLeft).Column
Question = 0
HeaderCopy = 4

Sheets("Formatted").Cells(1, 1).Value = "Location"
Sheets("Formatted").Cells(1, 2).Value = "Date"
Sheets("Formatted").Cells(1, 3).Value = "Spanish"

'copy question numbers into header
For j = 5 To LastColumn
    If Question <> Cells(4, j).Value Then
        Question = Cells(4, j).Value
        Sheets("Formatted").Cells(1, HeaderCopy).Value = Question
        HeaderCopy = HeaderCopy + 1
    End If
Next j


'''''''''''''''''''
' COPY DATA
'''''''''''''''''''
RowAdjustment = 4 'used to begin data on second row

'Loop across all responses
For i = 6 To LastRow 'for each row starting on row 6
    
    'Pull out location names
    If InStr(Cells(i, 1), " (n=") Then
        Location = Cells(i, 1).Value
        Location = Trim(Left(Location, InStr(Cells(i, 1), " (n=")))
        RowAdjustment = RowAdjustment + 1 'to avoid blank rows in resulting data
    Else
        
        'Copy responses
        Sheets("Formatted").Cells(i - RowAdjustment, 1).Value = Location
        Sheets("Formatted").Cells(i - RowAdjustment, 2).Value = Cells(i, 3).Value 'Date
        Sheets("Formatted").Cells(i - RowAdjustment, 3).Value = Cells(i, 4).Value 'Spanish
        
        'Loop across all questions
        For j = 5 To LastColumn
            If Cells(i, j).Value <> "" Then
                Question = Cells(4, j).Value
                Answer = Cells(5, j).Value
                DestinationColumn = Application.WorksheetFunction.Match(Question, Sheets("Formatted").Rows(1), 0)
                Sheets("Formatted").Cells(i - RowAdjustment, DestinationColumn).Value = Answer
            End If
        Next j
    
    End If

Next i


'format
Sheets("Formatted").Select
Cells.EntireColumn.AutoFit
Range("A1").Select

End Sub
