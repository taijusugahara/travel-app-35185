function date_calc (){
  const Day = document.getElementById("hotel_day");
  const total_price = document.getElementById("total_price");
  const Price = document.querySelector("#hotel-price");
  Price.addEventListener("change", () => {
    let price = Price.value;
    let day = Day.value;
    total_price.innerHTML = price * day;
  });
  Day.addEventListener("input", () => {
    let price = Price.value;
    let day = Day.value;
    total_price.innerHTML = price * day;
});
  
}
window.addEventListener('load', date_calc);