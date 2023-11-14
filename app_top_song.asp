<!--#include file="connection.asp"-->
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>SpotiFake</title>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width" />
      <link rel="stylesheet" href="CSS.css" />
      <link rel="stylesheet" href="https://cdn.boxicons.com/2.0.7/css/boxicons.min.css">
   </head>
   <body>
   
      <div class="App">
         <div class="App__top-bar">
            <div class="App__header">
               <div class="App__song-navigation">
                  <div class="App__song-navigation-prev">
                     <svg role="img" focusable="false" height="24" width="24" viewBox="0 0 24 24" onclick="goBack()">
                        <polyline points="16 4 7 12 16 20" fill="none" stroke="#fff"></polyline>
                     </svg>
                  </div>
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
                        <svg width="16" height="16" fill="currentColor" viewBox="0 0 18 20" xmlns="http://www.w3.org/2000/svg" data-testid="user-icon">
                           <path d="M15.216 13.717L12 11.869C11.823 11.768 11.772 11.607 11.757 11.521C11.742 11.435 11.737 11.267 11.869 11.111L13.18 9.57401C14.031 8.58001 14.5 7.31101 14.5 6.00001V5.50001C14.5 3.98501 13.866 2.52301 12.761 1.48601C11.64 0.435011 10.173 -0.0879888 8.636 0.0110112C5.756 0.198011 3.501 2.68401 3.501 5.67101V6.00001C3.501 7.31101 3.97 8.58001 4.82 9.57401L6.131 11.111C6.264 11.266 6.258 11.434 6.243 11.521C6.228 11.607 6.177 11.768 5.999 11.869L2.786 13.716C1.067 14.692 0 16.526 0 18.501V20H1V18.501C1 16.885 1.874 15.385 3.283 14.584L6.498 12.736C6.886 12.513 7.152 12.132 7.228 11.691C7.304 11.251 7.182 10.802 6.891 10.462L5.579 8.92501C4.883 8.11101 4.499 7.07201 4.499 6.00001V5.67101C4.499 3.21001 6.344 1.16201 8.699 1.00901C9.961 0.928011 11.159 1.35601 12.076 2.21501C12.994 3.07601 13.5 4.24301 13.5 5.50001V6.00001C13.5 7.07201 13.117 8.11101 12.42 8.92501L11.109 10.462C10.819 10.803 10.696 11.251 10.772 11.691C10.849 12.132 11.115 12.513 11.503 12.736L14.721 14.585C16.127 15.384 17.001 16.884 17.001 18.501V20H18.001V18.501C18 16.526 16.932 14.692 15.216 13.717Z" fill="#fff"></path>
                        </svg>
                     </div>
                     <span class="App__username"><%=UNAME%></span>
                     <div class="App__expand-arrow">
                        <svg role="img" height="16" width="16" viewBox="0 0 16 16">
                           <path d="M13 10L8 4.206 3 10z" fill="#fff"></path>
                        </svg>
                     </div>
                  </button>
                  <div class="dropdown-content">
                     <form method=POST action="">
                        <input type="submit" class="drop" name="AccButton" value="Account" />
                     </form>
                     <%
                        If Request.Form("LogoutButton") = "Logout" Then
                            Session.Abandon()
                           Response.Redirect("app.asp")
                        
                        End If
                        %> 
                     <form method=POST action="app.asp">
                        <input type="submit" class="drop" name="LogoutButton" value="Logout" />
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
               <svg viewBox="0 0 254 37" fill="none">
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
               <div class="App__category-item">
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
                     <svg role="img" height="12" width="12" aria-hidden="true" viewBox="0 0 16 16" fill="#c4c4c4">
                        <path d="M14 7H9V2H7v5H2v2h5v5h2V9h5z"></path>
                        <path fill="none" d="M0 0h16v16H0z"></path>
                     </svg>
                  </div>
                  <span>Create Playlist</span>
               </div>
               <div class="App__category-item" onclick="redirectFunction2('app_topic.asp')">
                  <div class="icon">
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                        <path d="M19 10H5c-1.103 0-2 .897-2 2v8c0 1.103.897 2 2 2h14c1.103 0 2-.897 2-2v-8c0-1.103-.897-2-2-2zM5 6h14v2H5zm2-4h10v2H7z"></path>
                     </svg>
                  </div>
                  <span>Song topic</span>
               </div>
               <div class="App__category-item">
                  <div class="icon">
                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                        <path d="M6 18.573c2.206 0 4-1.794 4-4V4.428L19 7.7v7.43a3.953 3.953 0 0 0-2-.557c-2.206 0-4 1.794-4 4s1.794 4 4 4 4-1.794 4-4V7a.998.998 0 0 0-.658-.939l-11-4A.999.999 0 0 0 8 3v8.13a3.953 3.953 0 0 0-2-.557c-2.206 0-4 1.794-4 4s1.794 4 4 4z"></path>
                     </svg>
                  </div>
                  <span>Top music</span>
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
            <%
            topid=request.querystring("Topid")
                  Set rs1 = Server.CreateObject("ADODB.Recordset")
                  Set rs2 = Server.CreateObject("ADODB.Recordset")
            sql1="select * from TopBXH "
          rs1.open sql1, conn
          sql2=rs1("TopSQL")
          rs2.open sql2, conn
            %>

            <div class="playlist-content">
               <div class="playlist-cover">
                  <img src="images\<%=rs1("AnhTOP")%>" alt="">
               </div>
               <div class="playlist-info">
                  <div class="playlist-title"><%=rs1("TenTop")%></div>
                  <div class="playlist-description"><%=rs1("MotaTop")%></div>
                  <div style="height: 60px;"></div>
                  <div class="playlist-stats">
                     <span> Spotify ·</span>
                     <span>5,131,321 likes · </span>
                     <span>100 songs, </span>
                     <span>6 hr 57 min </span>
                  </div>
               </div>
            </div>
            <div class="playlist-songs-container">
               <div class="playlist-buttons">
                  <div class="playlist-buttons-left">
                     <div class="playlist-buttons-resume-pause">
                        
                     </div>
                     <div class="playlist-buttons-like">
                        <svg height="32" width="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path fill="#1DB954" d="M8.667 1.912a6.257 6.257 0 00-7.462 7.677c.24.906.683 1.747 1.295 2.457l7.955 9.482a2.015 2.015 0 003.09 0l7.956-9.482a6.188 6.188 0 001.382-5.234l-.49.097.49-.099a6.303 6.303 0 00-5.162-4.98h-.002a6.24 6.24 0 00-5.295 1.65.623.623 0 01-.848 0 6.257 6.257 0 00-2.91-1.568z"></path>
                        </svg>
                     </div>
                     <div class="playlist-buttons-three-dot">
                        <svg role="img" height="32" width="32" aria-hidden="true" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path fill="#CACACA" d="M4.5 13.5a1.5 1.5 0 100-3 1.5 1.5 0 000 3zm15 0a1.5 1.5 0 100-3 1.5 1.5 0 000 3zm-7.5 0a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"></path>
                        </svg>
                     </div>
                  </div>
                
               </div>
               <div class="playlist-songs" >
                  <table>
                     <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Country</th>
                        <th>View</th>
                        <th>Rating</th>
                     </tr>
                     
                     <%
                      count=1
Do While Not rs2.EOF
    Songid = rs2("IDBaiHat")
%>
    <tr class="songdetail" onclick="redirectFunction1('<%=Songid%>')">
        <td><%=count%></td>
        <td class="song-title">
            <div class="song-image">
                <img src="images\<%=rs2("AnhBH")%>" alt="">
            </div>
            <div class="song-name-album">
                <div class="song-name"><%=rs2("TenBaiHat")%></div>
                <div class="song-artist">
                    <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;">
                        <path d="M12 16c2.206 0 4-1.794 4-4V6c0-2.217-1.785-4.021-3.979-4.021a.933.933 0 0 0-.209.025A4.006 4.006 0 0 0 8 6v6c0 2.206 1.794 4 4 4z"></path>
                        <path d="M11 19.931V22h2v-2.069c3.939-.495 7-3.858 7-7.931h-2c0 3.309-2.691 6-6 6s-6-2.691-6-6H4c0 4.072 3.061 7.436 7 7.931z"></path>
                    </svg><%=rs2("TenCaSi")%> - <%=rs2("BiDanh")%>
                </div>
            </div>
        </td>
        <td class="song-date-added"><%=rs2("QuocGia")%></td>
        <td class="song-album"><%=rs2("LuotXem")%></td>
        <td class="song-duration" style="font-size: 13px;"><%=rs2("DiemDG")%><svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" style="fill: white;transform: ;msFilter:;"><path d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg></td>
    </tr>
<%
count=count+1
    rs2.MoveNext
Loop
count=1
rs2.Close
%>

      <script src="javascript.js"></script>
   </body>
</html>