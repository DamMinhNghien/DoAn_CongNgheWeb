<%
    Set conn = Server.CreateObject("ADODB.Connection")
    Set rs = Server.CreateObject("ADODB.Recordset")
	Set rs1 = Server.CreateObject("ADODB.Recordset")
    set rs2 = Server.CreateObject("ADODB.Recordset")
     set rs3 = Server.CreateObject("ADODB.Recordset")
      set rs4 = Server.CreateObject("ADODB.Recordset")
    ' Chuỗi kết nối đến SQL Server
    strConn = "Provider=SQLOLEDB; Data Source=(local); Initial Catalog=DoAnWeb; User ID=trello; Password=1230321"
    
    conn.open strConn ' Mở kết nối
    
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
   
</head>
<body>
	
</body> 
</html>