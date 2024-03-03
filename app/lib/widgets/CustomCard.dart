import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final String text;

  const CustomCard({
    Key? key,
    required this.leftIcon,
    required this.rightIcon,
    required this.text,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 8),
              Icon(widget.leftIcon, color: Colors.white,),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.rightIcon, color: Colors.white,),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),

        ],
      ),
    );
  }
}
