import 'package:flutter/material.dart';

//import 'package:section1112/data/dummy_items.dart';
import 'package:section1112/models/grocery_item.dart';
import 'package:section1112/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  Future<void> _additems() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item){
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No Item'),
    );

    if (_groceryItems.isNotEmpty){
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction){
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(
            _groceryItems[index].id
          ),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _additems,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:content,
    );
  }
}
