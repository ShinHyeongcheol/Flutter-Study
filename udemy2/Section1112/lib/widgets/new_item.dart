import 'package:flutter/material.dart';
import 'package:section1112/data/categories.dart';
import 'package:section1112/models/category.dart';
import 'package:section1112/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enterQuantity = 1;
  var _enterCategory = categories[Categories.vegetables]!;

  void _saveitem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredName);
      print(_enterQuantity);
      print(_enterCategory);
      Navigator.of(context).pop(
        GroceryItem(
            id: DateTime.now().toString(),
            name: _enteredName,
            quantity: _enterQuantity,
            category: _enterCategory),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    'Name',
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'must be between 1 and 50 characters.';
                  }
                  return null;
                }, // 트리거가 없어서 실행 X 유효성 검사 논리
                onSaved: (value) {
                  if (value == null) {
                    return;
                  }
                  _enteredName = value;
                },
              ), // instead of TextField() -> 문제
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    //가로로 제한되지 않았기 때문에 Expended 필요
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enterQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) ==
                                null || // int면 숫자 반환, 아니면 null
                            int.tryParse(value)! <= 0) {
                          return 'must be a valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enterQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _enterCategory,
                      items: [
                        for (final catecory in categories.entries)
                          DropdownMenuItem(
                            value: catecory.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: catecory.value.color,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(catecory.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        _enterCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveitem,
                    child: Text('Add Item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
