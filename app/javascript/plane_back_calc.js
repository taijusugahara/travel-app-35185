function plane_back_calc (){
  const Howmany = document.getElementById("plane_back_howmany");
  const total_price = document.getElementById("total_price");
  const Price = document.querySelector("#plane-price");
  Price.addEventListener("change", () => {
    let price = Price.value;
    let howmany = Howmany.value;
    total_price.innerHTML = price * howmany;
  });
  Howmany.addEventListener("input", () => {
    let price = Price.value;
    let howmany = Howmany.value;
    total_price.innerHTML = price * howmany;
});
  
}
window.addEventListener('load', plane_back_calc);