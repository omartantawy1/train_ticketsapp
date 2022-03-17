import 'package:flutter/material.dart';

TextEditingController? controller;

class typeBottomSheet extends StatefulWidget {
  typeBottomSheet(TextEditingController? _cont) {
    controller = _cont;
  }

  @override
  State<typeBottomSheet> createState() =>
      _typeBottomSheetState(controller);
}

String valuet = "";

Object? st;

void setval(String _value) {
  controller?.text = _value;
}

class _typeBottomSheetState extends State<typeBottomSheet> {
  _typeBottomSheetState(TextEditingController? con) {
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: Colors.grey[600],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RadioListTile(
                  value: 1,
                  groupValue: st,
                  title: Text("Air Conditioned"),
                  onChanged: (val) {
                    setval("Air Conditioned");
                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 2,
                  groupValue: st,
                  title: Text("Upgraded"),
                  onChanged: (val) {
                    setval("Upgraded");
                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 3,
                  groupValue: st,
                  title: Text("Russian"),
                  onChanged: (val) {
                    setval("Russian");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 4,
                  groupValue: st,
                  title: Text("VIP"),
                  onChanged: (val) {
                    setval("VIP");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 5,
                  groupValue: st,
                  title: Text("Sleep"),
                  onChanged: (val) {
                    setval("Sleep");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 6,
                  groupValue: st,
                  title: Text("Air Conditioned + Upgraded"),
                  onChanged: (val) {
                    setval("Air Conditioned + Upgraded");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 7,
                  groupValue: st,
                  title: Text("Express"),
                  onChanged: (val) {
                    setval("Express");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }

                    });
                  },
                  activeColor: Colors.red,
                ),
                ListTile(
                    title: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
