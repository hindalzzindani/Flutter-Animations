import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
//
import '../controllers/switch_controller.dart';
import '../controllers/wallet_controller.dart';
import '../utils/constanst.dart';
import '../controllers/flower_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const MyFAB(),
          appBar: const MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                TopImage(),
                HeaderWidget(),
                MiddleDescription(),
                DeliveryTime(),
                BottomPrice()
              ],
            ),
          )),
    );
  }
}

/// Bottom Price Widget Components
class BottomPrice extends StatelessWidget {
  const BottomPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 1300),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          width: w / 4,
          height: h / 10,
          child: Column(
            children: [
              Text(
                "Total Price",
                style: GoogleFonts.oxygen(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\$${Get.find<FlowerController>().Roses[_controller.currentRoseIndex].price.toStringAsFixed(2)}",
                style: GoogleFonts.oxygen(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Delivery Time Widget Components
class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 1100),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: w,
        height: h / 22,
        child: Row(
          children: [
            Text(
              "Delivery Time",
              style: GoogleFonts.oxygen(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              LineIcons.clock,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              Get.find<FlowerController>()
                  .Roses[_controller.currentRoseIndex]
                  .deliveryTime,
              style: GoogleFonts.oxygen(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Middle Description Widget Components
class MiddleDescription extends StatelessWidget {
  const MiddleDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: w,
        height: h / 9,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              Get.find<FlowerController>()
                  .Roses[_controller.currentRoseIndex]
                  .description,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            )),
      ),
    );
  }
}

/// My Custom FloatingActionButton
class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _FlowerController = Get.find<FlowerController>();
    var _controller = Get.find<SwitchController>();
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.purple[700],
        onPressed: () {
          Get.find<WalletController>().add(
            id: _FlowerController.Roses[_controller.currentRoseIndex].id,
            img: _FlowerController.Roses[_controller.currentRoseIndex].img,
            title: _FlowerController.Roses[_controller.currentRoseIndex].title,
            subtitle:
            _FlowerController.Roses[_controller.currentRoseIndex].subtitle,
            price: _FlowerController.Roses[_controller.currentRoseIndex].price,
          );
        },
        child: const Icon(
          LineIcons.shoppingCart,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

/// Header Widget Components - Blow Top Image
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();

    return SizedBox(
      width: w,
      height: h / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 300),
            child: SizedBox(
              width: w / 1.6,
              child: Text(
                Get.find<FlowerController>()
                    .Roses[_controller.currentRoseIndex]
                    .title,
                style: GoogleFonts.oxygen(
                  fontSize: Get.find<FlowerController>()
                              .Roses[_controller.currentRoseIndex]
                              .title
                              .length <=
                          13
                      ? 26
                      : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 1),
            width: w / 3.4,
            height: h / 18,
            child: Row(
              children: [
                FadeInLeft(
                  delay: const Duration(milliseconds: 400),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: IconButton(
                      onPressed: () {
                        Get.find<FlowerController>()
                            .addQ(_controller.currentRoseIndex);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: GetBuilder<FlowerController>(
                          id: "quantity",
                          builder: (context) {
                            return Text(
                              Get.find<FlowerController>()
                                  .Roses[_controller.currentRoseIndex]
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            );
                          })),
                ),
                FadeInRight(
                  delay: const Duration(milliseconds: 600),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple[700],
                    child: IconButton(
                      onPressed: () {
                        Get.find<FlowerController>()
                            .removeQ(_controller.currentRoseIndex);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Top Image Widget Components
class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Spin(
      delay: const Duration(milliseconds: 200),
      child: SizedBox(
        width: w,
        height: h / 2.3,
        child: Hero(
            tag: Get.find<FlowerController>()
                .Roses[_controller.currentRoseIndex]
                .id,
            child: Image.asset(
              Get.find<FlowerController>()
                  .Roses[_controller.currentRoseIndex]
                  .img,
            )),
      ),
    );
  }
}

/// AppBar Components
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 100),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
    );
  }
}
