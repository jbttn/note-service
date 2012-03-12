// To prevent nav dropdown from closing when clicking on form items
$('.dropdown form').on('click', function (e) {
  e.stopPropagation();
});