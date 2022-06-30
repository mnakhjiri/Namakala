class CartData{
  int count = 1;
  int price = 0;
  int max = 0;
  bool visible = true;
  var product;

  CartData(this.price, this.max, this.product , this.count);

  increase(){
      if(count < max){
        count++;
      }
  }
  decrease(){
    if(count > 0){
      count--;
    }
    if(count == 0){
      visible = false;
    }
  }
  int getPrice(){
    return price*count;
  }
}