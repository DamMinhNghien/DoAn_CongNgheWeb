<%
	set conn = Server.CreateObject("ADODB.Connection")
	set rs = Server.CreateObject("ADODB.Recordset")
	set rs1 = Server.CreateObject("ADODB.Recordset")
	set rs2 = Server.CreateObject("ADODB.Recordset")
	strconn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.Mappath("database.mdb")
	conn.open strconn  'Mở kết nối

'sql="insert into Categories(cname,cimage,cdesc, corder,cstatus)values ('Samsun','samsung.jpg','Hãng điện thoại được ưa chuộng thứ hai hiện nay',2,1)" 
	'sql = "delete from Categories where cid>2"
	'conn.execute sql  'thực hiện insert 
	'conn.close
	
	
%>