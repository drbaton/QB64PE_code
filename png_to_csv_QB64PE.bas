Screen _NewImage(640, 400, 256)
_Title "bmp to csv maker and palette from screen 13 8bit"
'_Resize On
'_FullScreen _SquarePixels
Dim x_bmp_size As Integer
Dim y_bmp_size As Integer
x_bmp_size = 197
y_bmp_size = 35


Dim kolory(x_bmp_size, y_bmp_size) As Integer

' import image
image& = _LoadImage("sub.png")
_PutImage (0, 0), image&

' get colors from image
For y = 0 To y_bmp_size
    For x = 0 To x_bmp_size
        kolory(x, y) = Point(x, y)
    Next x
Next y

_FreeImage image&

' create CSV
filename$ = "img_data.csv"
Open filename$ For Output As #1

For y = 0 To y_bmp_size
    line$ = ""
    For x = 0 To x_bmp_size
        line$ = line$ + Str$(kolory(x, y))
        If x < x_bmp_size Then line$ = line$ + ","
    Next x
    Print #1, line$
Next y

'now you can add color matrix from csv file to yours qb64 program on the end as DATA

Close #1
Sleep

' clear screen and make palette (color numbers)
Cls

Const BOX_SIZE = 3
Const COLORS_PER_ROW = 16
Const TOTAL_COLORS = 256
Dim row As Integer
Dim col As Integer
row = 1
col = 1
For i = 0 To TOTAL_COLORS - 1
    Color i
    Locate row, col
    Print (i)
    col = col + 4
    If col >= 50 Then
        col = 1
        row = row + 1
    End If

Next

Sleep


