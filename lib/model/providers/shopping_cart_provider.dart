import 'package:flutter/cupertino.dart';

class ShoppingCartProvider extends ChangeNotifier {
  ShoppingCart cart = ShoppingCart();
  String isDeliverable = 'Y';

  void changeType(String t){
    this.isDeliverable = t;
    notifyListeners();
  }

  void addItem(CartItem item) {
    var existingItemIndex =
    cart.items.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      cart.items[existingItemIndex].quantity += item.quantity;
    } else {
      cart.addItem(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    cart.removeByItemId(item.id);
    notifyListeners();
  }
  String getType() {
    if(cart.type == "N")
      return "Take Away" ;
    else
      return "Delivery";
  }

  void removeItemCount(CartItem item) {
    var existingItemIndex =
    cart.items.indexWhere((cartItem) => cartItem.id == item.id);

    if (existingItemIndex != -1) {
      if (cart.items[existingItemIndex].quantity > 1) {
        cart.items[existingItemIndex].quantity -= 1;
      } else {
        cart.removeByItemId(item.id);
      }
      notifyListeners();
    }
  }
  void orderType(String type) {
    cart.type = type;
    cart.items = [];
    notifyListeners();
  }
  double subTotalPrice(){
    double total = 0;
    for (var item in cart.items)
      total += item.price * item.quantity;
      return total;
  }
  double getGST(){
    return (subTotalPrice() + getServiceCharges())*cart.gstCharges;
  }
  double getServiceCharges(){
    return subTotalPrice() * cart.serviceCharges;
  }
  double getDeliveryCharges(){
    return cart.deliveryCharges;
  }
  double calculateTotalPrice() {
    double total = 0;
    if(cart.items != null){
      total = subTotalPrice();
      if(cart.type == 'N')
        total += total * cart.serviceCharges;
      else
        total += cart.deliveryCharges;
    }
    return total + total * cart.gstCharges;
  }
}

class ShoppingCart {
  List<CartItem> items = [];
  String type = 'N';
  double deliveryCharges = 500;
  double serviceCharges = 0.07;
  double gstCharges = 0.15;

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  void removeByItemId(String itemId) {
    items.removeWhere((item) => item.id == itemId);
  }
}

class CartItem {
  String id;
  String name;
  double price;
  int quantity;
  String imgPath;

  CartItem(this.id, this.name, this.price, this.quantity, this.imgPath);
}
