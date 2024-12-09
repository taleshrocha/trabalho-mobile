import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.3;
    double containerHeight = screenHeight * 0.2;
    double imageWidth = containerWidth * 0.9;
    double imageHeight = containerHeight * 0.6;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3FF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(
              0,
              2,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/692/600',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Nome Item',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 14 : 18, // Adjust text size for smaller screens
            ),
          ),
        ],
      ),
    );
  }
}
