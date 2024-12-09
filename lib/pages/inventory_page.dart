import 'package:flutter/material.dart';
import '../components/item.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                    'Inventário',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
                      onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 20,
    ),
    itemCount: 20, // Example number of items
    itemBuilder: (context, index) {
    return ItemWidget();
    },
    ),
    ),
    );
  }
}