
import 'package:flutter/material.dart';

// Step 1: Define a Callback.
typedef void IntCallback(int id);

class ChildW extends StatelessWidget {
  // Step 2: Configre the child to expect a callback in the constructor(next 2 lines):
  final IntCallback onSonChanged;
  ChildW({ @required this.onSonChanged });
  
  int elementId = 3;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // Step 3: Trigger the callback
        onSonChanged(elementId);
      },
      child: Text('Click me'),
    ),
  }
}


//--------------------------------------------------------------------------------------------



///
/// Inside the Parent Widget
///
import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int id;
  
  void updateId(int newId) {
    setState(() {
      id = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildW(
        // pass callback
        onSonChanged: (int newId) {
          updateId(newId)
        },
      )
    );
  }
}
