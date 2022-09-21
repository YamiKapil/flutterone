import 'package:flutter/material.dart';

class CoffeeAnimation extends StatefulWidget {
  const CoffeeAnimation({ Key? key }) : super(key: key);

  @override
  State<CoffeeAnimation> createState() => _CoffeeAnimationState();
}

class _CoffeeAnimationState extends State<CoffeeAnimation> with TickerProviderStateMixin{
  
  late AnimationController _coffeeAnimation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8dc9c),
      
    );
  }
}