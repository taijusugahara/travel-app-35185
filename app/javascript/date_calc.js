function date_calc (){
  const Day = document.getElementById("hotel_day");
  const total_price = document.getElementById("total_price");
  const Price = document.querySelector("#hotel-price");
  const Howmany = document.getElementById("hotel_howmany");
  Price.addEventListener("change", () => {
    let price = Price.value;
    let day = Day.value;
    let howmany = Howmany.value;
    total_price.innerHTML = price * day * howmany;
  });
  Day.addEventListener("input", () => {
    let price = Price.value;
    let day = Day.value;
    let howmany = Howmany.value;
    total_price.innerHTML = price * day * howmany;
  });
  Howmany.addEventListener("input", () => {
    let price = Price.value;
    let day = Day.value;
    let howmany = Howmany.value;
    total_price.innerHTML = price * day * howmany;
  });
  
}
window.addEventListener('load', date_calc);