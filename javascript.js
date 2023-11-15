function redirectFunction(tid) {
  // Specify the URL you want to redirect to
  var destinationPage =
    "app_topic_song.asp?TId=" +
    encodeURIComponent(tid);
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
function redirectFunction4(idtop) {
  // Specify the URL you want to redirect to
  var destinationPage =
    "app_top_song.asp?IDTop=" +
    encodeURIComponent(idtop);
  // Redirect to the specified page
  window.location.href = destinationPage;
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
}
 function goBack() {
        window.history.back();
    }