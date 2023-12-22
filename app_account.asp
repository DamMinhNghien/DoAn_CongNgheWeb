<!--#include file="connection.asp"-->
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>SpotiFake</title>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width" />
      <link rel="stylesheet" href="CSS.css" />
      <link rel="stylesheet" href="https://cdn.boxicons.com/2.0.7/css/boxicons.min.css">
   </head>
   <body>
      <div class="App">
      <div class="App__top-bar"> 
         <div class="App__header">
          
            <%
               if Session("UID") <> "" and Session("UNAME") <> "" then
                   ' Lấy UID và UNAME từ Session
                   Dim UID
                   Dim UNAME
                   UID = Session("UID")
                   UNAME = Session("UNAME")
                 else
                 UID=""
                 UNAME=""
                   end if
               Set rs = Server.CreateObject("ADODB.Recordset")
               sql="select * from TaiKhoan where IDTK like '" & UID & "'"
               rs.open sql, conn
               
                 if(not rs.eof) then 
               %>
            <div class="dropdown">
               <button class="App__user">
                  <div class="App__figure">
                     <img class="App__image" style="object-fit:cover;border-radius: 50%;" src="images/<%=rs("anh")%>" alt="">
                  </div>
                  <span class="App__username"><%=UNAME%></span>
                  <div class="App__expand-arrow">
                     <svg role="img" height="16" width="16" viewBox="0 0 16 16">
                        <path d="M13 10L8 4.206 3 10z" fill="#fff"></path>
                     </svg>
                  </div>
               </button>
               <div class="dropdown-content">
                 <form method=POST action="app_account.asp">
                     <input type="submit" class="drop"  name="AccButton" value="Account"/>
                  </form>
                  <form method=POST action="app_history.asp">
                     <input type="submit" class="drop"  name="AccHistory" value="History"/>
                  </form>
                  <%
                     If Request.Form("LogoutButton") = "Logout" Then
                         Session.Abandon()
                        Response.Redirect("app.asp")
                     
                     End If
                     %>
                  <form method=POST action="app.asp">
                     <input type="submit" class="drop"  name="LogoutButton" value="Logout"/>
                  </form>
               </div>
            </div>
            <% else %>
            <div class="signup-login-wrapper">
               <div class="signup-login">
                  <a href="./signup.asp" class="signup" >
                     Sign Up</a>
                     <a class="login" href="./login.asp">
                     Login</a>
               </div>
            </div>
            <% 
               end if 
               
               %>
         </div>
      </div>
      <div class="App__nav-bar">
           <div class="App__logo">
               <svg viewBox="0 0 254 37" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <text x="38" y="25" fill="#fff" style="font-size: 35px;">SpotiFake</text>
               </svg>
            </div>
         <div class="App__categories-nav">
            <div id="DivApp" class="App__category-item" onclick="redirectFunction2('app.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                     <path d="M3 13h1v7c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2v-7h1a1 1 0 0 0 .707-1.707l-9-9a.999.999 0 0 0-1.414 0l-9 9A1 1 0 0 0 3 13zm7 7v-5h4v5h-4zm2-15.586 6 6V15l.001 5H16v-5c0-1.103-.897-2-2-2h-4c-1.103 0-2 .897-2 2v5H6v-9.586l6-6z"></path>
                  </svg>
               </div>
               <span>Home</span>
            </div>
            <div class="App__category-item" onclick="redirectFunction2('app_search.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                     <path d="M10 18a7.952 7.952 0 0 0 4.897-1.688l4.396 4.396 1.414-1.414-4.396-4.396A7.952 7.952 0 0 0 18 10c0-4.411-3.589-8-8-8s-8 3.589-8 8 3.589 8 8 8zm0-14c3.309 0 6 2.691 6 6s-2.691 6-6 6-6-2.691-6-6 2.691-6 6-6z"></path>
                  </svg>
               </div>
               <span>Search</span>
            </div>
            <div class="App__category-item" id="DivMyplaylist"onclick="redirectFunction2('app_myplaylist.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                     <path d="M13 16.493C13 18.427 14.573 20 16.507 20s3.507-1.573 3.507-3.507c0-.177-.027-.347-.053-.517H20V6h2V4h-3a1 1 0 0 0-1 1v8.333a3.465 3.465 0 0 0-1.493-.346A3.51 3.51 0 0 0 13 16.493zM2 5h14v2H2z"></path>
                     <path d="M2 9h14v2H2zm0 4h9v2H2zm0 4h9v2H2z"></path>
                  </svg>
               </div>
               <span>Your Playlist</span>
            </div>
         </div>
         <div class="App__playlists-nav">
            <div class="App__category-item">
               <div class="icon">
                  <svg role="img" height="12" width="12" aria-hidden="true" viewBox="0 0 16 16"
                     fill="#c4c4c4">
                     <path d="M14 7H9V2H7v5H2v2h5v5h2V9h5z"></path>
                     <path fill="none" d="M0 0h16v16H0z"></path>
                  </svg>
               </div>
                <input type="submit" id="addpl" name="fav_language" value="none">
               <label  class ="crtpl" for="addpl" onclick="submitForm3('<%= UID %>')">Create PlayList</label>
            </div>
            <!-- Alert Popup -->
            <div id="alertPopup" class="alert">      
               <span onclick="closeAlert()" style="float:right; cursor:pointer;">&times;</span>
                  
                     <p><form action="app_myplaylist_insert.asp" method="post" >
                    <input type="hidden" name="txtUID" value="<%=UID%>">
                    <div class="alert__plname">
                     <label class = "fdName" for="folderName">Playlist Name:</label>
                     <input class = "txName" type="text" id="folderName" name="plName" required>
   </div>
                    <div class="alert__plimg">
                     <label class = "imgfd" for="image">Choose Image:</label>
                     <input class = "imgimg" type="file" id="image" name="plimage" accept="image/*" required>
</div>
                    <button class = "btfd" type="submit">Create</button></p>
                        </div>
                       </form>
            <div class="App__category-item" onclick="redirectFunction2('app_topic.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                     <path d="M19 10H5c-1.103 0-2 .897-2 2v8c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2v-8c0-1.103-.897-2-2-2zM5 6h14v2H5zm2-4h10v2H7z"></path>
                  </svg>
               </div>
               <span>Song topic</span>
            </div>
            <div class="App__category-item" onclick="redirectFunction2('app_top.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                     <path d="M6 18.573c2.206 0 4-1.794 4-4V4.428L19 7.7v7.43a3.953 3.953 0 0 0-2-.557c-2.206 0-4 1.794-4 4s1.794 4 4 4 4-1.794 4-4V7a.998.998 0 0 0-.658-.939l-11-4A.999.999 0 0 0 8 3v8.13a3.953 3.953 0 0 0-2-.557c-2.206 0-4 1.794-4 4s1.794 4 4 4z"></path>
                  </svg>
               </div>
               <span>Top music</span>
            </div>
            <div class="App__category-item" onclick="redirectFunction2('app_Album.asp')">
               <div class="icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;"><circle cx="11.99" cy="11.99" r="2.01"></circle><path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm0 18a8 8 0 1 1 8-8 8 8 0 0 1-8 8z"></path><path d="M12 6a6 6 0 0 0-6 6h2a4 4 0 0 1 4-4z"></path></svg>
               </div>
               <span>Album</span>
            </div>
         </div>
         <div class="App__divider-container">
            <hr>
         </div>
      </div>
      <div class="App__main-view">
         <div class="App__top-gradient"></div>
         <div class="App__header-placeholder"></div>

        	<form method=POST action="app_account_edit.asp">
            <div class="acct">
			<table class="accounttable " width=100%>
            <tr>
            <th></th>
            <th style="color:white;text-align:center;float:left;margin-right:300px;font-size:30px;">Thông tin tài khoản
            <br></th>
            </tr>
            <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("acc_uname_error")%>
                </font>
            </center>
            <center>
                <font color="red" style="font-size: 12px;">
                    <%=Session("acc_unumber_error")%>
                </font>
            </center>
             <%  session("acc_uname_error")=""%>
            <%  session("acc_unumber_error")=""%>
				<tr>
                    <td style="float:right;">ID tài khoản:</td>
					<td ><input class="accinput" type=text name="txtUID" value="<%=rs("IDTK")%>" readonly></td>
				</tr>
                <tr>
					<td style="float:right;">Tên tài khoản:</td>
					<td><input class="accinput" type=text name=txtTenTK  value="<%=rs("TenTK")%>"></td>
				</tr>
                <tr>
					<td style="float:right;">Mật khẩu:</td>
					<td><input class="accinput" type=text  name=txtMatKhau  value="<%=rs("MatKhau")%>"></td>
				</tr>
                <tr>
					<td style="float:right;">Số điện thoại:</td>
					<td><input class="accinput" type=text   name=txtSDT  value="<%=rs("SDT")%>"></td>
				</tr>
            <tr>
					<td style="float:right;">Ảnh đại diện:</td>
               <%if rs("anh") <>"" then
               picture = rs("anh")
               else picture = "MacDinh.jpg"
               end if
               %>
               <td> <img style="object-fit:cover;border-radius: 50%; height: 100px; width: 100px; margin-right: 10px;margin-bottom: 10px;" src="images/<%=picture%>" alt="">
				</tr>
            <tr>
            <td style="float:right;">Thay ảnh mới tại đây:</td>
            <td><input  type=file   name=txtNewImage  value="<%=rs("anh")%>"></td>
            </tr>
				<tr>
					<td style="float:right;">Ngày lập:</td>
                    <td ><%=rs("NgayLap")%></td>
				</tr>
				<tr>
    <td style="float:right;">Trạng thái:</td>
    <td>
        <% 
             trangThaiValue = rs("TrangThai")
            If trangThaiValue = 1 Then
                trangThaiText = "Hoạt động"
            Else
             trangThaiText = "Không hoạt động"
            end if
            Response.Write(trangThaiText)
        %>
    </td>
</tr>
				<tr>
					<td style="float:right;">Loại tài khoản:</td>
                     <td ><%=rs("LoaiTK")%></td>
                     
				</tr>
                <tr>
				<td >
				</td>
				<td><input class="login"  type=submit value="Cập nhật">
                <!-- <input type=hidden value="" name="cid">-->
                 <input class="login"  type=reset value="Hủy bỏ"></td>
			</tr>
				</div>
      <script src="javascript.js"></script>
   </body>
   <%
   rs.close
               conn.close%>
</html>