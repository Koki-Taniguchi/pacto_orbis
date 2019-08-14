$(function () {
  $('.create').click(function () {
    var form_data = new FormData();
    form_data.append("address[name]", $('.new_address').find('#address_name').val());
    form_data.append("address[postal_code]", $('.new_address').find('#address_postal_code').val());
    form_data.append("address[address]", $('.new_address').find('#address_address').val());
    form_data.append("authenticity_token", $('input[name = "authenticity_token"]').val());
    $('.new_address').find('#address_name').val("");
    $('.new_address').find('#address_postal_code').val("");
    $('.new_address').find('#address_address').val("");
    $.ajax({
      url: '/addresses',
      type: 'post',
      data: form_data,
      processData: false,
      contentType: false,
      dataType: 'json'
    }).done((data) => {
      let tag_data = $(".user-address").html();
      tag_data += '<div><label><input type="radio" value="' + data.id + '"name="order[address_select]">この住所を使う</label>';
      tag_data += '<a href="/addresses/' + data.id + '/edit">編集</a> <a rel="nofollow" data-method="delete" href="/addresses/' + data.id + '">削除</a>';
      tag_data += '<p><span>' + data.name + '</span><br><span>' + data.postal_code + '</span><br><span>' + data.address + '</span></p></div>';
      $('.user-address').html(tag_data);
    })
  });
});