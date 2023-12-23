

function redirectFunction(tid) {
  // Specify the URL you want to redirect to
  var destinationPage = "app_topic_song.asp?TId=" + encodeURIComponent(tid);
  // Redirect to the specified page
  window.location.href = destinationPage;
}
function redirectFunction1(songid) {
  var destinationPage1 = "app_song.asp?Songid=" + encodeURIComponent(songid);
  window.location.href = destinationPage1;
}
function redirectFunction2(address) {
  // Perform the redirection using the provided address
  window.location.href = address;
}
function redirectFunction3(topid) {
  var destinationPage1 = "app_top_song.asp?Topid=" + encodeURIComponent(topid);
  window.location.href = destinationPage1;
}
function redirectFunction4(IDalbum) {
  var destinationPage2 =
    "app_album_song.asp?IDPlayList=" + encodeURIComponent(IDalbum);
  window.location.href = destinationPage2;
}
function redirectFunction5(singerid) {
  var destinationPage1 =
    "app_casi.asp?Singerid=" + encodeURIComponent(singerid);
  window.location.href = destinationPage1;
}

var currentURL = window.location.href;

if (currentURL.includes("app_search.asp")) {
  var DivSearch = document.getElementById("DivSearch");
  DivSearch.classList.add("App__category-item--selected");
} else if (currentURL.includes("app.asp")) {
  var DivApp = document.getElementById("DivApp");
  DivApp.classList.add("App__category-item--selected");
} else if (currentURL.includes("topic.asp")) {
  var DivApp = document.getElementById("DivTopic");
  DivApp.classList.add("App__category-item--selected");
} else if (currentURL.includes("app_top.asp")) {
  var DivApp = document.getElementById("DivTop");
  DivApp.classList.add("App__category-item--selected");
} else if (currentURL.includes("app_myplaylist.asp")) {
  var DivApp = document.getElementById("DivMyplaylist");
  DivApp.classList.add("App__category-item--selected");
} else if (currentURL.includes("app_Album.asp")) {
  var DivApp = document.getElementById("DivAlbum");
  DivApp.classList.add("App__category-item--selected");
}

function submitForm(inputId, uID) {
  var uid = uID;

  if (uid === "") {
    var wantToLogin = confirm(
      "Vui lòng đăng nhập trước khi đánh giá. Bạn có muốn đăng nhập ngay bây giờ?"
    );

    if (wantToLogin) {
      // Redirect to the login page with a parameter indicating the need to reset the form
      window.location.href = "login.asp?resetForm=true";
    }
  } else {
    // Check if there's a URL parameter indicating the need to reset the form

    // Trigger the click event on the specified element
    document.getElementById(inputId).click();

    // Submit the form with id "ratingForm"
    document.getElementById("ratingForm").submit();
  }
}
function submitForm2(inputId, uID) {
  var uid = uID;

  if (uid === "") {
    var wantToLogin = confirm(
      "Vui lòng đăng nhập trước khi đánh giá. Bạn có muốn đăng nhập ngay bây giờ?"
    );

    if (wantToLogin) {
      // Redirect to the login page with a parameter indicating the need to reset the form
      window.location.href = "login.asp?resetForm=true";
    }
  } else {
    // Check if there's a URL parameter indicating the need to reset the form

    // Trigger the click event on the specified element
    document.getElementById(inputId).click();
  }
}

document.addEventListener("DOMContentLoaded", function () {
  // Lấy tất cả các phần tử có class "comment-time"
  var commentTimeElements = document.querySelectorAll(".comment-time");

  // Lặp qua từng phần tử để cập nhật thời gian
  commentTimeElements.forEach(function (commentTimeElement) {
    // Lấy thời gian từ thuộc tính data-ngaygio
    var ngayGioString = commentTimeElement.getAttribute("data-ngaygio");
    var ngayGio = new Date(ngayGioString);

    // Tính thời gian hiện tại và thời gian viết bài
    var now = new Date();
    var timeDifference = now - ngayGio;
    var secondsDifference = Math.floor(timeDifference / 1000);
    var minutesDifference = Math.floor(secondsDifference / 60);
    var hoursDifference = Math.floor(minutesDifference / 60);
    var daysDifference = Math.floor(hoursDifference / 24);

    // Xác định xem nên hiển thị thông tin theo giây, phút, giờ hay ngày
    var timeAgo;
    if (secondsDifference < 60) {
      timeAgo = secondsDifference + " giây trước";
    } else if (minutesDifference < 60) {
      timeAgo = minutesDifference + " phút trước";
    } else if (hoursDifference < 24) {
      timeAgo = hoursDifference + " giờ trước";
    } else {
      timeAgo = daysDifference + " ngày trước";
    }

    // Cập nhật nội dung của phần tử
    commentTimeElement.textContent = timeAgo;
  });
});

function Like(idbinhluan) {
  var currentLikeCount = parseInt(
    document.getElementById("LikeCount" + idbinhluan).innerText
  );

  // Tăng giá trị LikeCount lên 1
  var newLikeCount = currentLikeCount + 1;

  // Cập nhật giá trị LikeCount trong HTML
  document.getElementById("LikeCount" + idbinhluan).innerText = newLikeCount;
}
function UnLike(idbinhluan) {
  var currentLikeCount = parseInt(
    document.getElementById("LikeCount" + idbinhluan).innerText
  );

  // Tăng giá trị LikeCount lên 1
  var newLikeCount = currentLikeCount - 1;

  // Cập nhật giá trị LikeCount trong HTML
  document.getElementById("LikeCount" + idbinhluan).innerText = newLikeCount;
}
function toggleLike(element, idbinhluan, idTK, idBaiHat) {
  var isLiked = element.classList.contains("active");

  if (isLiked) {
    UnLike(idbinhluan);
    element.classList.toggle("active", !isLiked);
    var xhr = new XMLHttpRequest();
    //var url = "app_comment.asp"; // Update this path with the actual server-side script
    var url =
      "app_comment_Unlike.asp" +
      "?IDbinhluan=" +
      encodeURIComponent(idbinhluan) +
      "&IDTK=" +
      encodeURIComponent(idTK) +
      "&IDBaiHat=" +
      encodeURIComponent(idBaiHat);
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
  } else {
    Like(idbinhluan);
    element.classList.toggle("active");
    var xhr = new XMLHttpRequest();
    //var url = "app_comment.asp"; // Update this path with the actual server-side script
    var url =
      "app_comment_like.asp" +
      "?IDbinhluan=" +
      encodeURIComponent(idbinhluan) +
      "&IDTK=" +
      encodeURIComponent(idTK) +
      "&IDBaiHat=" +
      encodeURIComponent(idBaiHat);
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
}
function toggleLike(element, idbinhluan, idTK, idBaiHat) {
  var isLiked = element.classList.contains("active");

  if (isLiked) {
    UnLike(idbinhluan);
    element.classList.toggle("active", !isLiked);
    var xhr = new XMLHttpRequest();
    //var url = "app_comment.asp"; // Update this path with the actual server-side script
    var url =
      "app_comment_Unlike.asp" +
      "?IDbinhluan=" +
      encodeURIComponent(idbinhluan) +
      "&IDTK=" +
      encodeURIComponent(idTK) +
      "&IDBaiHat=" +
      encodeURIComponent(idBaiHat);
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
  } else {
    Like(idbinhluan);
    element.classList.toggle("active");
    var xhr = new XMLHttpRequest();
    //var url = "app_comment.asp"; // Update this path with the actual server-side script
    var url =
      "app_comment_like.asp" +
      "?IDbinhluan=" +
      encodeURIComponent(idbinhluan) +
      "&IDTK=" +
      encodeURIComponent(idTK) +
      "&IDBaiHat=" +
      encodeURIComponent(idBaiHat);
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
}
function submitForm3(uID) {
  var uid = uID;

  if (uid === "") {
    var wantToLogin = confirm(
      "Vui lòng đăng nhập trước khi tạo playlist của bạn. Bạn có muốn đăng nhập ngay bây giờ?"
    );

    if (wantToLogin) {
      // Redirect to the login page with a parameter indicating the need to reset the form
      window.location.href = "login.asp?resetForm=true";
    }
  } else {
   
    // Check if there's a URL parameter indicating the need to reset the form

    // Trigger the click event on the specified element
    document.getElementById("alertPopup").style.display = "block";
  }
}
function closeAlert() {
  // Close the alert popup
  document.getElementById("alertPopup").style.display = "none";
}
function submitForm4(uID) {
  var uid = uID;

  if (uid === "") {
    var wantToLogin = confirm(
      "Vui lòng đăng nhập trước khi tạo playlist của bạn. Bạn có muốn đăng nhập ngay bây giờ?"
    );

    if (wantToLogin) {
      // Redirect to the login page with a parameter indicating the need to reset the form
      window.location.href = "login.asp?resetForm=true";
    }
  } else {
    // Check if there's a URL parameter indicating the need to reset the form
    window.location.href = "app_myplaylist.asp";
    // Trigger the click event on the specified element
    document.getElementById("alertPopup").style.display = "none";
  }
}
function closeAlert() {
  // Close the alert popup
  document.getElementById("alertPopup").style.display = "none";
}