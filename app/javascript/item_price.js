const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {

  const addTaxDom = document.getElementById("add-tax-price");
  const itemTax = Math.floor(priceInput.value * 0.1);
  addTaxDom.innerHTML = itemTax;

  const profitDom = document.getElementById("profit");
  const itemProfit = Math.floor(priceInput.value - itemTax);
  profitDom.innerHTML = itemProfit;
})