import 'package:flutter/material.dart';

class IconDetail extends StatelessWidget {
  final VoidCallback? fonction;
  final IconData? icon;
  final Color? color;
  const IconDetail({
    Key? key,
    this.fonction,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      child: InkWell(
        onTap: fonction,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
      ),
    );
  }
}
