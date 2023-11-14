import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:section1112/data/categories.dart';
import 'package:section1112/models/category.dart';

//import 'package:section1112/data/dummy_items.dart';
import 'package:section1112/models/grocery_item.dart';
import 'package:section1112/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;
  late Future<List<GroceryItem>> _loaditems;

  @override
  void initState() {
    super.initState();
    _loadItems();
    _loaditems = _loadItems();
  } //init을 통해 위젯을 등장시킬때 초기화

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'udemysection12-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list.json');
    //try{
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed');
    }

    if (response.body == 'null') {
      /*setState(() {
          _isLoading = false;
        });*/
      return [];
    }

    final Map<String, dynamic> listData =
        json.decode(response.body); //데이터를 리스트 형태로 받아옴
    final List<GroceryItem> loadItems = [];
    for (final item in listData.entries) {
      final catrgory = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: catrgory,
        ),
      );
    }
    return loadItems;
    setState(() {
      _groceryItems = loadItems;
      _isLoading = false;
    });
    //} catch (error){
    setState(() {
      _error = 'Failed';
    });
    //}
  }

  Future<void> _additems() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );
    //_loadItems();
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    }); //post요청을 보내고, newItem의 값을 받아와 위젯에 보이게 함

    /*
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
    */
  }

  Future<void> _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        'udemysection12-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      }); //오류 가 있응면 다시 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No Item'),
    );
    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
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
    if (_error != null) {
      content = Center(
        child: Text(_error!),
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
      //body: content,
      body: FutureBuilder(
        future: _loaditems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (snapshot.data!.isEmpty){
            return Center(child: Text('No item'),);
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(snapshot.data![index]);
              },
              key: ValueKey(snapshot.data![index].id),
              child: ListTile(
                title: Text(snapshot.data![index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: snapshot.data![index].category.color,
                ),
                trailing: Text(
                  snapshot.data![index].quantity.toString(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
