window.addEventListener('DOMContentLoaded', () => {


  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    const priceTax = Math.floor(inputValue/10);
    console.log(addTaxDom.textContent);

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue - priceTax);
    console.log(profitDom.textContent);
  })
});