import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ved_foodish/models/grocery_manager.dart';
import 'package:ved_foodish/screens/empty_grocery_screen.dart';
import 'package:ved_foodish/screens/grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGroceryScreen(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(
            context,
            listen: false,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                onCreate: (item) {
                  log("Item created");
                  manager.addItem(item);
                  Navigator.pop(context);
                },
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          print(manager.groceryItems.first.isComplete);
          print(manager.groceryItems.last.name);
          return Container(
            color: Colors.amber,
            child: Center(
              child: Column(
                children: [
                  for (var items in manager.groceryItems) Text("${items.name} - Is Complete => ${items.isComplete}"),
                ],
              ),
            ),
          );
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
