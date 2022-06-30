class CartData{
  int count = 0;
  int price = 0;
  int max = 0;
  var product;

  CartData(this.price, this.max, this.product);

  increase(){
      if(count < max){
        count++;
      }
  }
  decrease(){
    if(count > 0){
      count--;
    }
  }
  getPrice(){
    return price*count;
  }
}