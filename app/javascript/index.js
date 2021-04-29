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
    var countD;
    var countE;
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
      countD = box.filter(function(a){
                      return a === "d"
                  }).length;
      countE = box.filter(function(b){
                      return b === "e"
                  }).length;

    });
  });



//結果を出力する関数
  $('.end').on('click',function(){
    //endクラスをクリックしたときの関数
    if( countA > countB && countA > countC && countA > countD && countA > countE ) {
      $('#answer_01').css("display",""); //回答1
    //answer_01のdisplayを""へ
  } else if(countB > countA && countB >countC && countB >countD && countB >countE){
    $('#answer_02').css("display","");//回答2
      //answer_02のdisplayを""へ
  } else if(countC > countA && countC > countB && countC > countD && countC > countE){
    $('#answer_03').css("display","");//回答3
  //answer_03のdisplayを""へ
  } else if(countD > countA && countD > countB && countD > countC && countD > countE){
    $('#answer_04').css("display","");//回答4
  //answer_04のdisplayを""へ
  } else if(countE > countA && countE > countB && countE > countC && countE > countD){
    $('#answer_05').css("display","");//回答5
  //answer_05のdisplayを""へ
 
  } else if( countA == countB && countA > countC && countA > countD && countA > countE){
    $('#answer_06').css("display","");//回答6
  //answer_06のdisplayを""へ   
  } else if( countA == countC && countA > countB && countA > countD && countA > countE){
    $('#answer_07').css("display","");//回答7
  //answer_07のdisplayを""へ
  } else if( countA == countD && countA > countB && countA > countC && countA > countE){
    $('#answer_08').css("display","");//回答8
  //answer_08のdisplayを""へ
  } else if( countA == countE && countA > countB && countA > countC && countA > countD){
    $('#answer_09').css("display","");//回答29
  //answer_09のdisplayを""へ 
  } else if( countB == countC && countB > countA && countB > countD && countB > countE){
    $('#answer_10').css("display","");//回答10
  //answer_10のdisplayを""へ
  } else if( countB == countD && countB > countA && countB > countC && countB > countE){
    $('#answer_11').css("display","");//回答11
    //answer_11のdisplayを""へ
  } else if( countB == countE && countB > countA && countB > countC && countB > countD){
    $('#answer_12').css("display","");//回答12
    //answer_12のdisplayを""へ
  } else if( countC == countD && countC > countA && countC > countB && countC > countE){
    $('#answer_13').css("display","");//回答13
    //answer_13のdisplayを""へ
  } else if( countC == countE && countC > countA && countC > countB && countC > countD){
    $('#answer_14').css("display","");//回答14
    //answer_14のdisplayを""へ
  } else if( countD == countE && countD > countA && countD > countB && countD > countC){
    $('#answer_15').css("display","");//回答15
    //answer_15のdisplayを""へ

  } else if( countA == countB && countA == countC && countA == countD && countA == countE ){
    $('#answer_16').css("display","");//回答16
    //answer_16のdisplayを""へ
    }
  });
});