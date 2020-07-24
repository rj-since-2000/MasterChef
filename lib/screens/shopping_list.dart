import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class ShoppingScreen extends StatefulWidget {
 final List<String> shoppingList;
  ShoppingScreen(this.shoppingList);
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState(shoppingList);
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  TextEditingController _textFieldController = TextEditingController();

  List<String> shoppingList;
  _ShoppingScreenState(this.shoppingList);
  //this.shoppingList = ['test'];
  void resetList() {
    setState(() {
      shoppingList = [];
    });
  }

  void addToList() {
    if (_textFieldController.text.isEmpty) return;
    setState(() {
      shoppingList.add('${_textFieldController.text}');
      _textFieldController.text = '';
    });
  }

  void showDialogBox(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Add to List',
              style: TextStyle(letterSpacing: 1),
            ),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "eg: salt and pepper"),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'CANCEL',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  addToList();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Shopping List'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => resetList(),
              child: Text(
                'CLEAR ALL',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      drawer: MainDrawer(),
      body: shoppingList.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 100,
                    color: Colors.black12,
                  ),
                  Text(
                    'No Items',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${shoppingList[index]}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )),
              itemCount: shoppingList.length,
            ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => showDialogBox(context)),
    );
  }
}
