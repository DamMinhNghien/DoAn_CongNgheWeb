
// // Lấy tất cả các phần tử có lớp "App__category-item"
// const categoryItems = document.querySelectorAll('.App__category-item');

// // Loại bỏ lớp "App__category-item--selected" khỏi tất cả các phần tử
// categoryItems.forEach(item => {
//   item.classList.remove('App__category-item--selected');
// });

// // Thêm lớp "App__category-item--selected" cho phần tử bạn muốn chọn
// const selectedCategoryItem = document.querySelector('.App__category-item--selected');
// selectedCategoryItem.classList.add('App__category-item--selected');



// Thêm một trình nghe sự kiện cho tất cả các phần tử có lớp "App__category-item"
function handleItemClick(selector) {
  const items = document.querySelectorAll(selector);

  items.forEach(item => {
    item.addEventListener('click', () => {
      const targetPage = item.getAttribute('data-target-page');
      window.location.href = targetPage;
    });
  });
}

// Example usage:
handleItemClick('.App__category-item');
handleItemClick('.signup');
handleItemClick('.login');
// Kiểm tra URL của trang hiện tại
var currentURL = window.location.href;

// Kiểm tra xem trang hiện tại có phải là trang "app.html" không
if (currentURL.includes("app_search.html")) {
  // Nếu trang là "app.html", thì đổi lớp CSS của phần tử div
  var DivSearch = document.getElementById('DivSearch');

  DivSearch.classList.add('App__category-item--selected');
}
else if (currentURL.includes("app.html")){
  var DivApp = document.getElementById('DivApp');
  DivApp.classList.add('App__category-item--selected');
}

