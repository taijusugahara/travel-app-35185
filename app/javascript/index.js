//ボタンを押すごとに画面が切り替わる関数
$(function () {

  $(".btn").on("click", function () {
    $(this).closest("div").css("display", "none");
    id = $(this).attr("href");
    $(id).addClass("fit").fadeIn("slow").show();
  });



//選択ボタンデータを配列に入れてカウントする関数
    var countA;
    var countB;
    var countC;
    var box =[];
  $(".btn").each(function(){
    $(this).on('click',function(){
      var value = $(this).data("value");
       box.push(value);

      countA = box.filter(function(x){
                    return x === "a"
                  }).length;
      countB = box.filter(function(y){
                      return y === "b"
                  }).length;
      countC = box.filter(function(z){
                      return z === "c"
                  }).length;
    });
  });



//結果を出力する関数
  $('.end').on('click',function(){
    //endクラスをクリックしたときの関数
    if( countA > countB & countC) {
      $('#answer_01').css("display",""); //回答1
    //answer_01のdisplayを""へ
  } else if(countB > countA & countC){
    $('#answer_02').css("display","");//回答2
      //answer_02のdisplayを""へ
  } else if(countC > countA & countB){
    $('#answer_03').css("display","");//回答2
  //answer_03のdisplayを""へ
  } else if( countA == countB && countA > countC){
    $('#answer_04').css("display","");//回答2
  //answer_04のdisplayを""へ   
  } else if( countA == countC && countA > countB){
    $('#answer_05').css("display","");//回答2
  //answer_05のdisplayを""へ
  } else if( countB == countC && countB > countA){
    $('#answer_06').css("display","");//回答2
  //answer_06のdisplayを""へ
  }
  });
});