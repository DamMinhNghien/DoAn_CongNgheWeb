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
                  Login </a>
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
              <div class="App__category-item"onclick="submitForm4('<%=UID%>') && redirectFunction2('app_myplaylist.asp')" >
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
            <div class="App__category-item"onclick="redirectFunction2('app_top.asp')">
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
      <br>
      <%songid = request.querystring("Songid") 
      if UID <> "" then
            Set rs4 = Server.CreateObject("ADODB.Recordset")
            sql4 = "SELECT * FROM LichSu WHERE IDTK = '" & UID & "' AND IDBaiHat = '" & songid & "'"
            rs4.Open sql4, conn
            if rs4.EOF then
             sql5 = "INSERT INTO LichSu (IDTK, IDBaiHat, NgayXem) VALUES ('" & UID & "', '" & songid & "', GETDATE())"
                conn.execute sql5
               else
               sql5= "UPDATE LichSu SET NgayXem = GETDATE() WHERE IDTK = '" & UID & "' AND IDBaiHat = '" & songid & "'"
                conn.execute sql5
                end if
               end if
            %>
         <%
            score = Request.Form("rating")
            Set rs3 = Server.CreateObject("ADODB.Recordset")
            sql3 = "SELECT * FROM DanhGia WHERE IDTK = '" & UID & "' AND IDBaiHat = '" & songid & "'"
            rs3.Open sql3, conn
            
            If score <> "" Then
            
               if  rs3.EOF then
                sql2 = "INSERT INTO DanhGia (IDTK, IDBaiHat, DiemDG) VALUES ('" & UID & "', '" & songid & "', '" & score & "')"
                conn.execute sql2
               checkedRating=score
               else
              sql2 = "UPDATE DanhGia SET DiemDG = '" & score & "' WHERE IDTK = '" & UID & "' AND IDBaiHat = '" & songid & "'"
               conn.execute sql2
               checkedRating=score
                End if
            
            Else
            
            Dim checkedRating
                checkedRating = "" 
               If rs3.EOF Then
                checkedRating = ""
               Else
                checkedRating = rs3("DiemDG")
              
               End If
            End If
             rs3.close
            %>
      <% 
      sql13 = "select * from BaiHat Where IDBaiHat= '" & songid & "'"
         rs11.open sql13, conn
         Set rs1 = Server.CreateObject("ADODB.Recordset")
         sql1 = "SELECT BaiHat.*, ChuDe.TenChuDe, CaSi.TenCaSi, Dg.DiemDG FROM BaiHat " & _
             "JOIN ChuDe ON BaiHat.IDChuDe = ChuDe.IDChuDe " & _
             "JOIN CaSi ON BaiHat.BiDanh = CaSi.BiDanh " & _
             "LEFT JOIN DanhGia AS Dg ON BaiHat.IDBaiHat = Dg.IDBaiHat " & _
             "WHERE BaiHat.IDBaiHat LIKE '" & songid & "'"
         rs1.open sql1, conn
Set rs6 = Server.CreateObject("ADODB.Recordset")
sql6 = "SELECT Count(DiemDG) as LuotDG, ROUND(AVG(DiemDG), 1) as TBDG FROM DanhGia WHERE IDBaiHat = '" & songid & "'"
rs6.Open sql6, conn
LuotDG=rs6("LuotDG")
%>
<div class="song_infor">
   <div class="playlist-content">
      <div class="playlist-cover-song">
         <img src="images/<%=rs11("AnhBH")%>" alt="">
         <div style="height: 30px;"></div>
      </div>
      <div class="playlist-info">
         <div class="playlist-title" style="margin-bottom:10px;"><%=rs1("TenBaiHat")%></div>
         Ca sĩ chính: <%=rs1("TenCaSi")%>-<%=rs1("BiDanh")%>
         <div class="playlist-description">
            <div style="display: inline-block; margin-right: 60px;">
               Người sáng tác: <%=rs1("TacGia")%>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
               <path d="M12.25 2c-5.514 0-10 4.486-10 10s4.486 10 10 10 10-4.486 10-10-4.486-10-10-10zM18 13h-6.75V6h2v5H18v2z"></path>
            </svg>
            : <%=rs1("NgayPhatHanh")%>
            <br>
            Về bài hát: <%=rs1("MoTa")%>
            <br>
            Chủ đề/Thể loại: <%=rs1("TenChuDe")%>
            <br>
            Quốc Gia: <%=rs1("QuocGia")%>
         </div>
         <div class="playlist-stats">
             <%
         If LuotDG=0 Then
          %>
            <span> Chưa có đánh giá nào! ·</span>
         <%
         Else
         %>
            <span>Lượt đánh giá: <%=LuotDG%> ·</span>
            <span>Đánh giá: <%=rs6("TBDG")%> ★</span>
            
         <%
         rs6.Close
         End If
         
         %>
         </div>
      </div>
   </div>
</div>

      <br>
      <div class="App__main-song">
      <div class="left">
         <iframe width="700" height="400" src=<%=rs1("DuongDan")%> title="YouTube video player" frameborder="0" allow="accelerometer;autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
         
         <form method="post" action="" id="ratingForm" class="star-rating">
            <input type="radio" id="star5" name="rating" value="5" <% If checkedRating = "5" Then Response.Write("checked") %>>
            <label for="star5" onclick="return confirm('Bạn có chắc muốn đánh giá bài hát này 5 sao ?') && submitForm('star5','<%= UID %>')">★</label>
            <input type="radio" id="star4" name="rating" value="4" <% If checkedRating = "4" Then Response.Write("checked") %>>
            <label for="star4" onclick="return confirm('Bạn có chắc muốn đánh giá bài hát này 4 sao ?') && submitForm('star4','<%= UID %>')">★</label>
            <input type="radio" id="star3" name="rating" value="3" <% If checkedRating = "3" Then Response.Write("checked") %>>
            <label for="star3" onclick="return confirm('Bạn có chắc muốn đánh giá bài hát này 3 sao ?') && submitForm('star3','<%= UID %>')">★</label>
            <input type="radio" id="star2" name="rating" value="2" <% If checkedRating = "2" Then Response.Write("checked") %>>
            <label for="star2" onclick="return confirm('Bạn có chắc muốn đánh giá bài hát này 2 sao ?') && submitForm('star2','<%= UID %>')">★</label>
            <input type="radio" id="star1" name="rating" value="1" <% If checkedRating = "1" Then Response.Write("checked") %>>
            <label for="star1" onclick="return confirm('Bạn có chắc muốn đánh giá bài hát này 1 sao ?') && submitForm('star1','<%= UID %>')">★</label>
         </form>
     <% Set rs2 = Server.CreateObject("ADODB.Recordset")
             sql7  = "DECLARE @currentUserID INT; " & _
                     "SET @currentUserID = '" & UID & "'; " & _
                     "SELECT BinhLuan.*, TaiKhoan.* " & _
                     "FROM BinhLuan " & _
                     "JOIN TaiKhoan ON BinhLuan.IDTK = TaiKhoan.IDTK " & _
                     "WHERE IDBaiHat = '" & songid & "' " & _
                     "ORDER BY " & _
                     "CASE " & _
                     "    WHEN BinhLuan.IDTK = @currentUserID THEN 0 " & _
                     "    ELSE 1 " & _
                     "END, " & _
                     "BinhLuan.LuotThich DESC;"

            rs2.Open sql7, conn 
            %>
            <% if UID <>"" then%>
            <%
            sql12 = "SELECT PlayListCaNhan.IDPlayList, PlayListCaNhan.TenPlayList " & _
        "FROM PlayListCaNhan " & _
        "JOIN BaiHatPlayListCN ON BaiHatPlayListCN.IDPlayList = PlayListCaNhan.IDPlayList " & _
        "WHERE IDTK='" & UID & "' AND IDBaiHat='" & songid & "'"
rs10.Open sql12, conn
   if rs10.eof then
      IDPL=""
      else 
      IDPL=rs10("IDPlayList")
      end if
      response.write(IDPL)
sql11 = "select * From dbo.PlayListCaNhan where IDTK='" & UID &"' and IDPlayList<>'" & IDPL &"'"
rs9.Open sql11, conn

%>

<p style="color:white;margin-left:520px;">Thêm vào Playlist của bạn</p>

<%
if rs9.eof then
   if rs10.eof then
%>
    <select name="IDPlayList" style="margin-left:620px;">
        <option value="">Ko có Playlist</option>
    </select>
    <%else%>
     <form method="POST" action="app_song_add.asp">
    <select name="IDPlayList" style="margin-left:620px;" onchange="this.form.submit()">
    
  <option value="<%=rs10("IDPlayList")%>"><%=rs10("TenPlayList")%></option>
   <option value="">Choose Playlist</option>
   </select>
     <input type="hidden" name="songID" value="<%=songid%>" >

 <input type="hidden" name="UID" value="<%=UID%>" >
</form>
<%
   end if
else
%>
  <form method="POST" action="app_song_add.asp">
 
  <select name="IDPlayList" style="margin-left:620px;" onchange="this.form.submit()">
  <%if rs10.eof then
  %>
   <option value="">Choose Playlist</option>
 <%else%>
  <option value="<%=rs10("IDPlayList")%>"><%=rs10("TenPlayList")%></option>
  <option value="">Choose Playlist</option>
  <%end if%>
 <% While Not rs9.EOF
    If rs9("IDPlayList") <> IDPL Then
%>
        <option value="<%=rs9("IDPlayList")%>"><%=rs9("TenPlayList")%></option>
<%
    End If
    rs9.MoveNext
Wend
   %>
   <%
  end if
  %>
  <%
  rs9.close
%>

</select>
  <input type="hidden" name="songID" value="<%=songid%>" >

 <input type="hidden" name="UID" value="<%=UID%>" >
</form>
            <%
             end if %>
   <div class="comments-container">
   <% If UID <> "" Then %>
       <script>
       var next=1;
     function postComment() {
    var commentText = document.getElementById("commentText").value;
    var commentName = document.getElementById("CommentUName").value;
    var idTK = '<%=UID%>'; // Replace with the actual value of UID
    var idBaiHat = '<%=songid%>'; // Use the value of the songid parameter from the URL

    // Basic validation
    if (!commentText) {
        alert("Vui lòng nhập bình luận.");
        return;
    }
    <%
Set rs7 = Server.CreateObject("ADODB.Recordset")
             sql9  = "SELECT TOP 1 IDBinhLuan From BinhLuan ORDER BY IDBinhLuan DESC"
            rs7.Open sql9, conn 
            if rs7.eof then
             newidbinhluan=0
            else
            newidbinhluan=rs7("IDBinhLuan")
           end if
           rs7.close
            %>
        
     var IDNextComment=<%=newidbinhluan%>;
     IDNextComment=IDNextComment+next;
     next=next+1;
    
    var commentDiv = document.createElement("div");
    commentDiv.className = "comment";
    commentDiv.innerHTML = `
        <img src="images/<%=rs("anh")%>" alt="Commenter Avatar" width="50" height="50" class="comment-avatar">
        <div class="comment-content">
            <div class="comment-meta">
                <strong><%=rs("TenTK")%></strong>
                <p class="comment-time">Vừa xong</p>
            </div>
            <p class="comment-text">${commentText}</p>
        </div>
         <button class="like-button " onclick="toggleLike(this, ${IDNextComment},<%=UID%>,<%=songid%>)">
            <span class="like-icon" id="likeIcon">&#x2665;</span>
</button>
                <a style="color:white;" id="LikeCount${IDNextComment}">0</a>
    `;

    // Add the new comment to the comment list
    var commentList = document.getElementById("commentList");
   commentList.insertBefore(commentDiv, commentList.firstChild);

    // Clear the content in the comment form
    document.getElementById("commentText").value = "";

    // Send the comment to the server using AJAX
    sendCommentToServer(idTK, idBaiHat, commentText,IDNextComment);
}

function sendCommentToServer(idTK, idBaiHat, commentText,newidbinhluan) {
    var xhr = new XMLHttpRequest();
    //var url = "app_comment.asp"; // Update this path with the actual server-side script
    var url = "app_comment.asp" +
    "?IDTK=" + encodeURIComponent(idTK) +
    "&IDBaiHat=" + encodeURIComponent(idBaiHat) +
    "&Comment=" + encodeURIComponent(commentText) +
    "&IDComment=" + encodeURIComponent(newidbinhluan);
    xhr.open("GET", url, true);

    // Handle errors and the completion of the AJAX request
    xhr.onerror = function () {
        console.error("Error sending the comment to the server.");
    };

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log("Comment sent successfully");
                // You can handle the server's response here if needed
            } else {
                console.error("Error: " + xhr.status);
            }
        }
    };

    // Send the request with the FormData containing the fields
    xhr.send();
}
   </script>
      <!-- Commenter information -->
      <div class="commenter-info">
         <img src="images/<%=rs("anh")%>" alt="Commenter Avatar" class="commenter-avatar">
         <span class="commenter-name" id="CommentUName"><%=rs("TenTK")%></span>
      </div>

      <!-- Comment box -->
      <div class="comment-box">
         <textarea class="comment-input" placeholder="Write a comment..." id="commentText"></textarea>
         <button onclick="postComment()">Post</button>
      </div>
      <%
      
            if rs2.eof then %>
            <div id="commentList">
            <p style="color:white; text-align:center;">Chưa có bình luận nào</p></div>
            <% else
                while not rs2.eof %>
      <div id="commentList">
      <div class="comment" id="comment">
               <img src="images/<%=rs2("anh")%>" alt="Commenter Avatar" width="50" height="50" class="comment-avatar">
               <div class="comment-content">
                  <div class="comment-meta">
                     <strong><%=rs2("TenTK")%></strong>
                     <p class="comment-time" data-ngaygio="<%=rs2("NgayGio")%>"></p>

                  </div>
                  <p class="comment-text"><%=rs2("BinhLuan")%></p>
                  
               </div>
                <%   idbinhluan=rs2("IDBinhLuan")
                 Set rs5 = Server.CreateObject("ADODB.Recordset")
             sql8  = "SELECT IDTK FROM ThongKeLike WHERE IDBaiHat = '" & songid & "'  AND IDBinhLuan = '" & idbinhluan & "'AND IDTK= '" & UID & "'"
            rs5.Open sql8, conn
            if rs5.eof then
            idtk=0
            else
             idtk=rs5("IDTK")
             end if
              rs5.close
  
              %>
           <button class="like-button <% If idtk = UID Then Response.Write "active" %> " onclick="toggleLike(this, <%= idbinhluan %>,<%=UID%>,<%=songid%>)">
            <span class="like-icon" id="likeIcon">&#x2665;</span>
</button>
                <a style="color:white;" id="LikeCount<%=idbinhluan%>"><%=rs2("LuotThich")%></a>
            </div></div>
            <%
            rs2.MoveNext
            wend
            end if
            %>
   <% Else %>
   <div>
   <a style="color:white ;">Bạn chưa đăng nhập để bình luận?</a>
      <a style="color:white ;text-decoration: underline;font-weight: bold;" href="login.asp">Đăng nhập ngay</a>
      </div>
       <% if rs2.eof then %>
  <div id="commentList">
            <p style="color:white; text-align:center;">Chưa có bình luận nào</p></div>
            <% else
                while not rs2.eof %>
     <div id="commentList">
      <div class="comment" id="comment">
               <img src="images/<%=rs2("anh")%>" alt="Commenter Avatar" width="50" height="50" class="comment-avatar">
               <div class="comment-content">
                  <div class="comment-meta">
                     <strong><%=rs2("TenTK")%></strong>
                     <p class="comment-time" data-ngaygio="<%=rs2("NgayGio")%>"></p>

                  </div>
                  <p class="comment-text"><%=rs2("BinhLuan")%></p>
                  
               </div>
                <%   idbinhluan=rs2("IDBinhLuan")
                
              %>
           <button class="like-button" id="buttonlike" onclick="submitForm2('buttonlike', '<%=UID%>')">
            <span class="like-icon" id="likeIcon">&#x2665;</span>
</button>
                <a style="color:white;" id="LikeCount<%=idbinhluan%>"><%=rs2("LuotThich")%></a>
            </div></div>
            <%
            rs2.MoveNext
            wend
            end if
            %>
      
   <% End If %>

</div>

      </div>
      <div class="right">
      <h2 style="color:white; ">Danh sách đề xuất</h2>
      <% Set rs8 = Server.CreateObject("ADODB.Recordset")
sql10 = "SELECT TOP 5 BaiHat.AnhBH,BaiHat.IDBaiHat, BaiHat.TenBaiHat, BaiHat.QuocGia, CaSi.TenCaSi,ChuDe.TenChuDe FROM BaiHat JOIN ChuDe on ChuDe.IDChuDe=BaiHat.IDChuDe join CaSi ON BaiHat.BiDanh = CaSi.BiDanh WHERE BaiHat.IDBaiHat <> '" & songid & "' GROUP BY BaiHat.AnhBH,BaiHat.IDBaiHat, BaiHat.TenBaiHat, BaiHat.QuocGia, CaSi.TenCaSi,ChuDe.TenChuDe ORDER BY RAND()"
                rs8.open sql10, conn%>
      <div class="playlist-songs" >
       <%
            if rs8.eof then%>
            <p style="color:white;">không có bài hát nào được đề xuất</p>
           <%else 
            count=0 %>
         <table>
            <tr>
               <th>#</th>
               <th>Title</th>
               <th>Country</th>
               <th>Topic</th>
            </tr>
           <%while not rs8.eof 
           idbh=rs8("IDBaiHat")
           count=count+1
           %>
            <tr class="songdetail"onclick="redirectFunction1('<%=idbh%>')" >
               <td><%=count%></td>
               <td class="song-title">
                  <div class="song-image">
                     <img src="images\<%=rs8("AnhBH")%>" alt="">
                  </div>
                  <div class="song-name-album">
                     <div class="song-name"><%=rs8("TenBaiHat")%></div>
                     <div class="song-artist">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                           <path d="M12 16c2.206 0 4-1.794 4-4V6c0-2.217-1.785-4.021-3.979-4.021a.933.933 0 0 0-.209.025A4.006 4.006 0 0 0 8 6v6c0 2.206 1.794 4 4 4z"></path>
                           <path d="M11 19.931V22h2v-2.069c3.939-.495 7-3.858 7-7.931h-2c0 3.309-2.691 6-6 6s-6-2.691-6-6H4c0 4.072 3.061 7.436 7 7.931z"></path>
                        </svg>
                        <%=rs8("TenCaSi")%>
                        <div>
                        </div>
               </td>
               <td class="song-date-added"><%=rs8("QuocGia")%></td>
               <td class="song-duration" style="font-size: 13px;"><%=rs8("TenChuDe")%></td>
            </tr>
            <%
            rs8.MoveNext
            wend
            rs8.close
            end if%>
         </table>
         </div>
         </div>
      </div>
      <%

       
         rs1.close
                   rs.close
         conn.close
         %>
      <script src="javascript.js"></script>
   </body>
</html>