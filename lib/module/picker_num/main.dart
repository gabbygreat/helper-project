import 'package:flutter/material.dart';

class PickerNum extends StatefulWidget {
  const PickerNum({super.key});

  @override
  State<PickerNum> createState() => _PickerNumState();
}

class _PickerNumState extends State<PickerNum> {
  bool isPickedMode = false;
  List<int> pickedCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (isPickedMode)
            ? IconButton(
                onPressed: () {
                  // This clears our list
                  pickedCards.clear();
                  // Returns our pick mode to false
                  isPickedMode = false;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.close,
                ),
              )
            : null,
        title: const Text('Multi Picker'),
        actions: [
          if (isPickedMode)
            IconButton(
              // This can be anything, in a real application
              // you may want to send a list of selected items
              // to your backend
              onPressed: () => debugPrint(
                'The Selected Items are $pickedCards',
              ),
              icon: const Icon(
                Icons.check,
              ),
            ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onLongPress: () => setState(() {
            // If the index is not already in our list, add it
            if (!pickedCards.contains(index)) {
              pickedCards.add(index);
            }
            // set our pick mode to true
            // A long press is what activates our picked mode
            isPickedMode = true;
          }),
          onTap: () {
            // The OnTap should only do something if we are in picker mode already
            if (isPickedMode) {
              // If the index is not already in our list, add it
              if (!pickedCards.contains(index)) {
                pickedCards.add(index);
              } else {
                // If it already is and we click again, remove it from the list
                // ie, unselect it
                pickedCards.remove(index);
              }
              // If after the above is executed and there's nothing in our list again
              // return us back to the non-picker mode
              if (pickedCards.isEmpty) {
                isPickedMode = false;
              }
            }
            setState(() {});
          },
          child: Container(
            color: Colors.red,
            child: isPickedMode
                ? Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: pickedCards.contains(index)
                            ? Text('${pickedCards.indexOf(index) + 1}')
                            : const Text(''),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
