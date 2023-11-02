import 'package:flutter/material.dart';

class ListSelection extends StatefulWidget {
  const ListSelection({super.key});

  @override
  State<ListSelection> createState() => _ListSelectionState();
}

class _ListSelectionState extends State<ListSelection> {
  bool enteredMulti = false;
  List<int> selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('List selection'),
        actions: [
          if (enteredMulti)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => InkWell(
          onLongPress: () => setState(() {
            enteredMulti = true;
            selectedList.add(index);
          }),
          onTap: () {
            if (enteredMulti) {
              if (selectedList.contains(index)) {
                selectedList.remove(index);
              } else {
                selectedList.add(index);
              }
              if (selectedList.isEmpty) {
                enteredMulti = false;
              }
              setState(() {});
            }
          },
          child: ListTile(
            leading: (enteredMulti && selectedList.contains(index))
                ? const Icon(Icons.check_circle)
                : const Icon(Icons.circle),
            title: Text('Tile $index'),
          ),
        ),
      ),
    );
  }
}
