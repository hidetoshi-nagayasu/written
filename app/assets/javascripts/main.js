$(function() {
    $('.modal').modal();

    // 記事編集画面でのアイキャッチ画像削除
    $('.cancel').on('click', function() {
      $(this).remove();
      $('.edit-eye-catch').remove();
      $('.new-eye-catch').show();
    });

    $('#search').on('click', function() {
      $(this).hide();
      $('.search-form').show().focus();
    });

    $('.image-up').click(function() {
      $('.image-file').trigger("click");
    });

  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.post').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "600px",
                  class: "preview",
                  title: file.name
              }));
        $('.edit-eye-catch').hide();
      };
    })(file);

    reader.readAsDataURL(file);
  });

});