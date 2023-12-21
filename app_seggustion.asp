<!--#include file="connection.asp"-->
<% Set rs = Server.CreateObject("ADODB.Recordset")
	keyword = Request.Querystring("keyword")
	sql =  "SELECT TOP 5 * FROM CaSi WHERE TenCaSi LIKE N'%" & KeyWord & "%' ORDER BY TenCaSi"
	rs.open sql, conn 
    SingerID=rs("BiDanh")
%>

<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
			
        <table width="100%" align="center" style="border-collapse: collapse;">
            <tr>
                <th style="width:100%; text-align: left; font-size:20px;">List of singers</th>
            </tr>
            <% If Not rs.EOF Then
        Do While Not rs.EOF %>
            <tr class="songdetail" onclick="redirectFunction1('<%=SingerID%>')" >
                <td style="text-align: center;">
                    <div style="display: flex; align-items: center;">
                        <img style="object-fit:cover;border-radius: 50%; height: 100px; width: 100px; margin-right: 10px;margin-bottom: 10px;" src="images/<%=rs("AnhCS")%>">
                        <div>
                            <a style="font-size: 20px;"><%=rs("TenCaSi")%> -</a>
                        </div>
                        <div style="margin-left: 10px;">
                            <a style="font-size: 20px;"><%=rs("BiDanh")%></a>
                        </div>
                    </div>
                </td>
            </tr>
              <% rs.MoveNext
        Loop
        Else
        %><tr>
        <td>
            <%  Response.Write "<p>Không tìm thấy kết quả.</p>"%>
              </td>
        </tr>
        <% End If
    rs.close
        conn.Close
        %>
        </table>
    
	</body>
</html>