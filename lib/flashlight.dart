import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class Flashlight extends StatefulWidget {
  const Flashlight({super.key});

  @override
  State<Flashlight> createState() => _FlashlightState();
}

class _FlashlightState extends State<Flashlight> {
  final bgColor = Colors.black;
  final textColor = Colors.yellow;
  var isOn = true;
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.00,
        centerTitle: true,
        title: Text(
          'Flash Light',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isOn ? 'assets/torch(1).png' : 'assets/torch.png',
                    width: 200,
                    height: 200,
                    color: isOn ? null : textColor.withOpacity(0.2),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 40,
                    child: Transform.scale(
                      scale: 2,
                      child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isOn = !isOn;
                            setState(() {});
                          },
                          icon: const Icon(Icons.power_settings_new)),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
