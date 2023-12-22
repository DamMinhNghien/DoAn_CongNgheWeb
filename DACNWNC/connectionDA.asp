<%
    Set conn = Server.CreateObject("ADODB.Connection")
    Set rs = Server.CreateObject("ADODB.Recordset")
	Set rs1 = Server.CreateObject("ADODB.Recordset")
    set rs2 = Server.CreateObject("ADODB.Recordset")
     set rs3 = Server.CreateObject("ADODB.Recordset")
      set rs4 = Server.CreateObject("ADODB.Recordset")
    ' Chuỗi kết nối đến SQL Server
    strConn = "Provider=SQLOLEDB;Data Source=ADMIN\MSSQLSERVER02;Initial Catalog=DoAnWeb;User ID=sa;Password=12"
    
    conn.open strConn ' Mở kết nối
    
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
   
</head>
<body>
	
</body> 
</html>