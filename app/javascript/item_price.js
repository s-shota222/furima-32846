window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const taxDom = inputValue * 0.1;
     const profit = inputValue - taxDom;
     const addTaxDom = document.getElementById("add-tax-price");
     const addProfit = document.getElementById("profit");
     addTaxDom.innerHTML = Math.floor(taxDom).toLocaleString();
     addProfit.innerHTML = Math.floor(profit).toLocaleString();
  })
});

