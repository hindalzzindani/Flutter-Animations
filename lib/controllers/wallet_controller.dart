import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/rose_model.dart';

class WalletController extends GetxController {
  List<RoseModel> walletflower = [];

  // Method for adding item into walletFlower List
  void add({
    required id,
    required img,
    required title,
    required subtitle,
    required price,
  }) {
    var contain = walletflower.where((element) => element.id == id);
    if (contain.isEmpty) {
      walletflower.add(RoseModel(
          id: id,
          img: img,
          title: title,
          subtitle: subtitle,
          deliveryTime: "",
          price: price,
          description: "",
          quantity: 0));
      Get.snackbar("Notice!", "Added To Your Wallet",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.endToStart);
      update();
    } else {
      Get.snackbar("Warning!", "You have Added this Item before",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
    }
  }

  // Method for removing all items from the walletFlower List
  void removeAllItems() {
    walletflower = [];
    update();
  }

  // Method for removing single item from walletFlower List
  void removeSingleItem(int index) {
    walletflower.removeAt(index);
    update();
  }

  // Method For Calculating Total Price of Flowers
  double totalAmount() {
    var sumPrice = 0.0;
    for (RoseModel walletFlower in walletflower) {
      sumPrice = sumPrice + walletFlower.price;
    }
    return sumPrice;
    
  }
}
