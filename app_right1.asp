<!--#include file="connection.asp"-->
<% Set rs = Server.CreateObject("ADODB.Recordset")
	keyword = Request.Querystring("keyword")

    sql = "SELECT TOP 5 BaiHat.IDBaiHat,BaiHat.AnhBH, BaiHat.TenBaiHat,BaiHat.BiDanh,CaSi.TenCaSi FROM BaiHat JOIN CaSi ON BaiHat.BiDanh = CaSi.BiDanh WHERE BaiHat.TenBaiHat LIKE N'%" & KeyWord & "%' GROUP BY BaiHat.IDBaiHat,BaiHat.AnhBH, BaiHat.TenBaiHat,BaiHat.BiDanh, CaSi.TenCaSi ORDER BY TenBaiHat"
	rs.open sql, conn 
%>

<html>
<head>
    <meta charset="utf-8">
</head>
<body>
    <table width="100%" align="center" style="border-collapse: collapse;">
        <tr>
            <th style="width:100%; text-align: left; font-size:20px;">List of songs</th>
            <th></th>
        </tr>
        <% 
        If rs.EOF Then
        %>
        <tr>
            <td>
                <%  Response.Write "<p>Không tìm thấy kết quả.</p>"%>
            </td>
        </tr>
        <%
        Else
            While Not rs.EOF 
              songid=rs("IDBaiHat")
        %>
        
        <tr class="songdetail" onclick="redirectFunction1('<%=Songid%>')" >
        
            <td style=" text-align: center;" >
                <div style="display: flex; align-items: center;">
                    <img style="object-fit:cover;height: 100px; width: 100px; margin-right: 10px;margin-bottom: 10px;" src="images/<%=rs("AnhBH")%>">
                    <div>
                        <a style="font-size: 20px;"><%=rs("TenBaiHat")%></a>
                        <br>
                        <a class="playlist-description" style="float: left;"><%=rs("TenCaSi")%> - <%=rs("BiDanh")%></a>
                    </div>
                </div>
            </td>
           
        </tr>
        <% 
        rs.MoveNext
        wend
        End If
        rs.close
        conn.Close
        %>
    </table>
</body>
</html>
