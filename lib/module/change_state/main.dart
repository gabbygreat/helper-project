import 'package:flutter/material.dart';


class ChangeState extends StatelessWidget {
  const ChangeState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Changing State',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PickerRole(
              type: PickerType.sledge,
            ),
            PickerRole(
              type: PickerType.reverse,
            ),
            PickerRole(
              type: PickerType.drop,
            ),
            PickerRole(
              type: PickerType.setting,
            ),
          ],
        ),
      ),
    );
  }
}

enum PickerType { sledge, reverse, drop, setting, none }

class PickerRole extends StatefulWidget {
  final PickerType type;
  const PickerRole({
    super.key,
    required this.type,
  });

  @override
  State<PickerRole> createState() => _PickerRoleState();
}

class _PickerRoleState extends State<PickerRole> {
  var picker = PickerType.none;

  @override
  void initState() {
    super.initState();
    picker = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      // color: Colors.green,
      height: 60,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Center(
                  child: Text('Sigil'),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() {
                        picker = PickerType.sledge;
                      }),
                      icon: const Icon(
                        Icons.sledding,
                      ),
                    ),
                    Container(
                      color: picker == PickerType.sledge
                          ? Colors.blue
                          : Colors.transparent,
                      height: 2,
                      width: 50,
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() {
                        picker = PickerType.reverse;
                      }),
                      icon: const Icon(
                        Icons.swap_horiz,
                      ),
                    ),
                    Container(
                      color: picker == PickerType.reverse
                          ? Colors.blue
                          : Colors.transparent,
                      height: 2,
                      width: 50,
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() {
                        picker = PickerType.drop;
                      }),
                      icon: const Icon(
                        Icons.water_drop,
                      ),
                    ),
                    Container(
                      color: picker == PickerType.drop
                          ? Colors.blue
                          : Colors.transparent,
                      height: 2,
                      width: 50,
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() {
                        picker = PickerType.setting;
                      }),
                      icon: const Icon(
                        Icons.settings,
                      ),
                    ),
                    Container(
                      color: picker == PickerType.setting
                          ? Colors.blue
                          : Colors.transparent,
                      height: 2,
                      width: 50,
                      margin: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Divider(
              height: 0,
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
