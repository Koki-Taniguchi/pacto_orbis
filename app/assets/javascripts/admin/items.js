$(function () {
  var id = $("#select-disk").val();
  $('#disk-' + id).removeClass('uncurrent-disk');
  $('#disk-' + id).addClass('current-disk');

  $('select').change(function () {
    $('.all-disk div').removeClass('current-disk');
    $('.all-disk div').addClass('uncurrent-disk');
    var id = $("#select-disk").val();
    $('#disk-' + id).removeClass('uncurrent-disk');
    $('#disk-' + id).addClass('current-disk');
  })
})