import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ved_foodish/components/components.dart';
import 'package:ved_foodish/models/tab_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset("assets/fooderlich_assets/empty_list.png"),
              ),
            ),
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              child: const Text("Browse Recipes"),
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnScrollUserPop extends StatelessWidget {
  const OnScrollUserPop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Card(
        color: Colors.white.withOpacity(0.8),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const <Widget>[
                CircleImage(),
                // Text in center
                Expanded(
                  child: Center(
                    child: Text('@selenagomez 🥶'),
                  ),
                ),
                // Trailing Share Icon
                Icon(Icons.share),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
