window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    profitDom.innerHTML = Math.floor(inputValue * 0.9)
  })
});