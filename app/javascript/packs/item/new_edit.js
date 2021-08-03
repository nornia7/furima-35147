window.addEventListener('load', function(){

  const inputPrice = document.getElementById('item-price')
  const outputTaxPrice = document.getElementById('add-tax-price')
  const outputProfit = document.getElementById('profit')

  inputPrice.addEventListener('input', function(){
    const priceValue = inputPrice.value
    const taxPrice = Math.floor(priceValue * 0.1)
    const profit = priceValue - taxPrice

    outputTaxPrice.innerHTML = taxPrice.toLocaleString()
    outputProfit.innerHTML = profit.toLocaleString()

  })
})