' filename: college_department_dictionary

' college_department_dict
'   key: college name
'   value: [department]
'       department: {id, name, abbr}

' The data is stored in the worksheet "��t�C��" in "B �Ѽ�.xlsx"
'   First row is the header
'   Column A: College Name
'   Column B: Department id
'   Column C: Department name
'   Column D: Department abbreviation

Function create_college_department_dict(wb As Workbook) As Scripting.Dictionary
    
    Dim college_department_dict As Scripting.Dictionary
    Dim college_name As Variant
    Dim department_list As Variant
    Dim department As Variant
    Dim department_dict As Scripting.Dictionary
    
    Set college_department_dict = New Scripting.Dictionary
    set ws = wb.Worksheets("��t�C��")
    last_row = ws.Cells(Rows.Count, 1).End(xlUp).Row

    For i = 2 To last_row
        college_name = ws.Cells(i, 1).Value
        department_id = ws.Cells(i, 2).Value
        department_name = ws.Cells(i, 3).Value
        department_abbr = ws.Cells(i, 4).Value
        
        ' If the college name is not in the dictionary, then add the college name to the dictionary
        If Not college_department_dict.Exists(college_name) Then
            Set department_list = New Collection
            college_department_dict.Add college_name, department_list
        End If
        
        Set department_dict = New Scripting.Dictionary
        department_dict.Add "id", department_id
        department_dict.Add "name", department_name
        department_dict.Add "abbr", department_abbr
        
        college_department_dict(college_name).Add department_dict
    Next i
    
    Set create_college_department_dict = college_department_dict

End Function

Private Sub test_create_college_department_dict()
    
    Dim college_department_dict As Scripting.Dictionary
    Dim college_name As Variant
    Dim department_list As Variant
    Dim department As Variant
    Dim department_dict As Scripting.Dictionary
    Dim wb As Workbook

    Set wb = Workbooks.Open(ThisWorkbook.path & "/B �Ѽ�.xlsx")
    Set college_department_dict = create_college_department_dict(wb)
    
    For Each college_name In college_department_dict.Keys
        MsgBox college_name
        Set department_list = college_department_dict(college_name)
        For Each department In department_list
            MsgBox department("id") & " " & department("name") & " " & department("abbr")
        Next department
    Next college_name
End Sub