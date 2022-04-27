import 'package:flutter/material.dart';
import 'package:to_do_app/elements/updateToDo.dart';
import 'package:to_do_app/screens/authenticate/db.dart';

class ToDos extends StatefulWidget {
  final String Ctitle;
  final bool done;
  final String id;

  const ToDos(
      {Key? key, required this.id, required this.Ctitle, required this.done})
      : super(key: key);

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  bool check = false;

  initState() {
    check = widget.done;
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60.0,
            ),
            child: UpdateForm(id: widget.id, name: widget.Ctitle),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
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
                  UpdateDone(widget.id, check);
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
                  onPressed: () {
                    _showSettingPanel();
                  },
                ),
                const SizedBox(width: 5),
                TextButton(
                  child: const Text(
                    'REMOVE',
                    style: TextStyle(
                      color: Color.fromRGBO(128, 90, 208, 1),
                    ),
                  ),
                  onPressed: () {
                    RemoveToDo(widget.id, check);
                  },
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
