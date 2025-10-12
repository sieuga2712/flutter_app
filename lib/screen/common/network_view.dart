import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkView extends StatelessWidget{
    final String description;
  const NetworkView({required this.description, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "lottie/No Connection.json",
                height: 400,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}