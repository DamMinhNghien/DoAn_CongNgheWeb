<!--#include file="connection.asp"-->
<%
Dim value, songid
value = Request.Form("IDPlayList")
songid = Request.Form("SongID")
UID = Request.Form("UID")

If value <> "" Then
    sql1 = "SELECT BaiHatPlayListCN.IDBaiHat, BaiHatPlayListCN.IDPlayList AS PlaylistID " & _
           "FROM BaiHatPlayListCN " & _
           "JOIN PlayListCaNhan ON BaiHatPlayListCN.IDPlayList = PlayListCaNhan.IDPlayList " & _
           "WHERE IDTK='" & UID & "' AND BaiHatPlayListCN.IDBaiHat='" & songid & "'"
    rs1.Open sql1, conn

    if rs1.EOF then
        ' Record not found, insert a new one
        sql = "INSERT INTO BaiHatPlayListCN (IDPlaylist, IDBaiHat) VALUES ('" & value & "','" & songid & "')"
        conn.Execute(sql)
    else
        ' Record found, update or delete as needed
        idcu = rs1("PlaylistID")
        sql2 = "DELETE FROM BaiHatPlayListCN WHERE IDPlayList='" & idcu & "' and IDBaiHat='" & songid & "'"
        conn.Execute(sql2)
        sql3 = "INSERT INTO BaiHatPlayListCN (IDPlaylist, IDBaiHat) VALUES ('" & value & "','" & songid & "')"
        conn.Execute(sql3)
    end if

    rs1.Close
    Response.Redirect "app_song.asp?songid=" & songid
End If

If value = "" Then 
    sql1 = "SELECT BaiHatPlayListCN.IDBaiHat, BaiHatPlayListCN.IDPlayList AS PlaylistID " & _
           "FROM BaiHatPlayListCN " & _
           "JOIN PlayListCaNhan ON BaiHatPlayListCN.IDPlayList = PlayListCaNhan.IDPlayList " & _
           "WHERE IDTK='" & UID & "' AND BaiHatPlayListCN.IDBaiHat='" & songid & "'"
    rs1.Open sql1, conn

    if not rs1.EOF then
        ' Record found, delete it
        idcu = rs1("PlaylistID")
        sql = "DELETE FROM BaiHatPlayListCN WHERE IDPlayList='" & idcu & "' and IDBaiHat='" & songid & "'"
        conn.Execute(sql)
    end if

    rs1.Close
    Response.Redirect "app_song.asp?songid=" & songid
End If
%>
