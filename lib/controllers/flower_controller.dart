import 'package:get/get.dart';
import '../model/rose_model.dart';

class FlowerController extends GetxController {
  List<RoseModel> Roses = [
    RoseModel(
      id: "1",
      img: "assets/images/1.png",
      title: "Rose",
      subtitle: "Love and beutiy Rose",
      price: 32.00,
      deliveryTime: "15 min",
      description:
          "A fragrant flower known for its variety of colors.",
      quantity: 1,
    ),
    RoseModel(
      id: "2",
      img: "assets/images/2.png",
      title: "Tulip",
      subtitle: "Love and beutiy Rose",
      price: 24.00,
      deliveryTime: "20 min",
      description:
          "A delicate spring flower with multiple colors.",
      quantity: 1,
    ),
    RoseModel(
      id: "3",
      img: "assets/images/3.png",
      title: "Sunflower",
      subtitle: "Love and beutiy Rose",
      price: 24.00,
      deliveryTime: "10 min",
      description:
          "A large yellow flower that follows the sun.!",
      quantity: 1,
    ),
    RoseModel(
      id: "4",
      img: "assets/images/4.png",
      title: "Lavender",
      subtitle: "Love and beutiy Rose",
      price: 29.00,
      deliveryTime: "7 min",
      description:
          " A purple flower with a calming fragrance..",
      quantity: 1,
    ),
  ];

  // For add 1 item from quantityes of flower
  void addQ(int index) {
    if (Roses[index].quantity < 9 && Roses[index].quantity >= 0) {
      Roses[index].quantity++;
    } else {
      Get.snackbar("Notice", "You can't add more than 9 item!");
    }
    update(["quantity"]);
  }

  // For remove 1 item from quantityes of flower
  void removeQ(int index) {
    if (Roses[index].quantity > 1 && Roses[index].quantity <= 9) {
      Roses[index].quantity--;
    } else {
      Get.snackbar("Notice", "You can't order 0 item!");
    }
    update(["quantity"]);
  }
}
