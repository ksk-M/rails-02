window.addEventListener("load", function () {   //ページを読み込んでから処理を実行
  $('#user-info').click(function () {
    $('#menu').toggleClass("add-none");
    console.log("テスト")   //後で消す！
  });
})
