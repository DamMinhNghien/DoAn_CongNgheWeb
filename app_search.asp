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
            
            <div class="search-container">
            <%timkiemvalue=request.form("timkiem")%>
               <form method=POST action="app_search.asp">
                  <div class="search-box">
                     <button type="submit" class="search-button">
                        <svg role="img" aria-hidden="true" class="search-icon" viewBox="0 0 16 16">
                           <path d="M7 1.75a5.25 5.25 0 1 0 0 10.5 5.25 5.25 0 0 0 0-10.5zM.25 7a6.75 6.75 0 1 1 12.096 4.12l3.184 3.185a.75.75 0 1 1-1.06 1.06L11.304 12.2A6.75 6.75 0 0 1 .25 7z"></path>
                        </svg>
                     </button>
                     <input class="search-input" type="text" placeholder="Bạn muốn nghe gì?" name="timkiem" id="search-box" value="<%=timkiemvalue%>">
                  </div>
               </form>
            </div>
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
               rs.close
               
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
         <br>
      <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){

  // Gọi ajax ngay khi trang load
  $.ajax({
    type: "GET", 
    url: "app_seggustion.asp",
    data: 'keyword=' + $("#search-box").val(),
    success: function(data){
      $("#left1").show();
      $("#left1").html(data);
    }
  });

  $.ajax({
    type: "GET",
    url: "app_right1.asp",
    data: 'keyword=' + $("#search-box").val(), 
    success: function(data){
      $("#right1").show();  
      $("#right1").html(data);
    }
  });

});
    $(document).ready(function(){
        $("#search-box").keyup(function(){
            $.ajax({
                type: "GET",
                url: "app_seggustion.asp",
                data: 'keyword=' + $(this).val(),
                success: function(data){
                    $("#left1").show();
                    $("#left1").html(data);
                }
            });
            $.ajax({
                type: "GET",
                url: "app_right1.asp",
                data: 'keyword=' + $(this).val(),
                success: function(data){
                    $("#right1").show();
                    $("#right1").html(data);
                }
            });
        });
    });

    function selectCountry(val) {
        $("#search-box").val(val);
        $("#left1").hide();
        $("#right1").hide();
    }
</script>
<div class="Search1">
    <div class="left1" id="left1"></div>
    <div class="right1" id="right1"></div>
</div>


      <script src="javascript.js"></script>
   </body>
</html>


