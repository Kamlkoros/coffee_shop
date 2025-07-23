import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:input_quantity/input_quantity.dart';

void main() {
  runApp(const MyApp());
}

Color kPrimaryColor = const Color(0xFFC67C4E);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Order'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedToggleSwitch<int>.size(
                current: value,
                style: ToggleStyle(
                  backgroundColor: const Color(0xFFEDEDED),
                  indicatorColor: kPrimaryColor,
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                values: const [0, 1],
                iconOpacity: 1.0,
                selectedIconScale: 1.0,
                indicatorSize: const Size.fromWidth(double.infinity),
                iconAnimationType: AnimationType.onHover,
                styleAnimationType: AnimationType.onHover,
                spacing: 5.0,
                customIconBuilder: (context, local, global) {
                  final text = const ['Delivery', 'Pick Up'][local.index];
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.lerp(
                          Colors.black,
                          Colors.white,
                          local.animationValue,
                        ),
                      ),
                    ),
                  );
                },
                borderWidth: 5.0,
                onChanged: (i) => setState(() => value = i),
              ),
              const SizedBox(height: 20),
              Text(
                'Delivery Address',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Jl. Kpg Sutoyo',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  customTextIconButton(
                    'Edit Address',
                    FontAwesomeIcons.penToSquare,
                    () {},
                  ),
                  SizedBox(width: 10),
                  customTextIconButton(
                    'Add Note',
                    FontAwesomeIcons.solidNoteSticky,
                    () {},
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade300, thickness: 1.0, height: 40),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/caffe_mocha.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Caffe Mocha',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Deep Foam',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Spacer(),
                  InputQty(
                    initVal: 1,
                    minVal: 1,
                    onQtyChanged: (value) {},
                    decoration: QtyDecorationProps(
                      isBordered: false,
                      btnColor: Colors.black,
                      borderShape: BorderShapeBtn.circle,
                      width: 12,
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF9F2ED), thickness: 4.0, height: 40),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.percent_rounded,
                        size: 22,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        '1 Discount is Applied',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Summary',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Price', style: TextStyle(fontSize: 16)),
                  const Text(
                    '\$4.53',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Delivery Fee', style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Text(
                    '\$2.0',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$1.0',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 170,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.wallet, size: 24, color: kPrimaryColor),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cash/Wallet',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$7.53',
                        style: TextStyle(
                          fontSize: 14,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Transform.rotate(
                    angle: 3.14159 * 1.5,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {},
                child: Text('Order',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customTextIconButton(
  String label,
  IconData icon,
  VoidCallback onPressed,
) {
  return TextButton.icon(
    icon: Icon(icon, size: 12, color: Colors.black),
    label: Text(label, style: TextStyle(color: Colors.black, fontSize: 12)),
    onPressed: onPressed,
    style: ButtonStyle(
      side: WidgetStateProperty.all(BorderSide(color: Colors.grey, width: 1.0)),
    ),
  );
}
