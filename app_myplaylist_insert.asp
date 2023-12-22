<!--#include file="connection.asp"-->
<%
UID=request.form("txtUID")
TenPlaylist = Request.Form("plname")
AnhPL = Request.Form("plimage")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * From dbo.PlayListCaNhan where TenPlaylist='" & TenPlaylist &"' and IDTK='" & UID &"'"
	rs.open sql, conn 
	if (not rs.eof) then
	    	
        Response.Redirect("app_myplaylist.asp")
    else 
    sql = "insert into dbo.PlayListCaNhan(TenPlaylist,AnhPL,IDTK) values ('"& TenPlaylist &"','"& AnhPL &"','" & UID &"')"

		conn.execute sql 
		conn.close
		
		Response.Redirect("app_myplaylist.asp")
	end if		
	
%>