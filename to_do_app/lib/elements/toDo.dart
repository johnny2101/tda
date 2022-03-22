import 'package:flutter/material.dart';

class ToDos extends StatefulWidget {
  final String Ctitle;
  const ToDos({Key? key, required this.Ctitle}) : super(key: key);

  

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    check = !check;
                  });
                },
                icon: Icon(check
                    ? Icons.check_circle_rounded
                    : Icons.check_circle_outline),
                color: Color.fromRGBO(128, 90, 208, 1),
              ),
              title: Text(widget.Ctitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(
                      color: Color.fromRGBO(128, 90, 208, 1),
                    ),
                  ),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 5),
                TextButton(
                  child: const Text(
                    'REMOVE',
                    style: TextStyle(
                      color: Color.fromRGBO(128, 90, 208, 1),
                    ),
                  ),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
