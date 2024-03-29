
Attribute VB_Name = "college_department_dictionary"
' 2023-07-11 17:14:52

' Passed all test

' college_department_dict
'   key: college name
'   value: [department]
'       department: {id, name, abbr, fullname}

' The data is stored in the worksheet "科系列表" in "B 參數.xlsx"
'   First row is the header
'   Column A: College Name
'   Column B: Department id
'   Column C: Department name
'   Column D: Department abbreviation
'   Column E: Department full name

Function college_department_dict_init(argument_wb As Workbook) As Scripting.Dictionary
    
    Dim college_department_dict As Scripting.Dictionary
    Dim college_name As Variant
    Dim department_list As Variant
    Dim department As Variant
    Dim department_dict As Scripting.Dictionary
    
    Set college_department_dict = New Scripting.Dictionary
    set ws = argument_wb.Worksheets("科系列表")
    last_row = ws.Cells(Rows.Count, 1).End(xlUp).Row

    For i = 2 To last_row
        college_name = ws.Cells(i, 1).Value
        department_id = ws.Cells(i, 2).Value
        department_name = ws.Cells(i, 3).Value
        department_abbr = ws.Cells(i, 4).Value
        department_fullname = ws.Cells(i, 5).Value
        
        ' If the college name is not in the dictionary, then add the college name to the dictionary
        If Not college_department_dict.Exists(college_name) Then
            Set department_list = New Collection
            college_department_dict.Add college_name, department_list
        End If
        
        Set department_dict = New Scripting.Dictionary
        department_dict.Add "id", department_id
        department_dict.Add "name", department_name
        department_dict.Add "abbr", department_abbr
        department_dict.Add "fullname", department_fullname
        
        college_department_dict(college_name).Add department_dict
    Next i
    
    Set college_department_dict_init = college_department_dict

End Function

' Passed test
Private Sub test_create_college_department_dict()
    
    Dim college_department_dict As Scripting.Dictionary
    Dim college_name As Variant
    Dim department_list As Variant
    Dim department As Variant
    Dim department_dict As Scripting.Dictionary
    Dim argument_wb As Workbook

    Set argument_wb = Workbooks.Open(ThisWorkbook.path & "/B 參數.xlsx")
    Set college_department_dict = college_department_dict_init(argument_wb)
    argument_wb.Close

    Dim file_path As String
    file_path = ThisWorkbook.path & "/output/college_department_dict.json"
    print_to_file  file_path, json_str(college_department_dict)
End Sub

' The path of the file that stores the data of the college in "1. 各院彙整資料"
Function college_excel_path(ByVal college_name As String) As String
    college_excel_path = ThisWorkbook.path & "/1. 各院彙整資料/" & college_name & ".xlsx"
End Function