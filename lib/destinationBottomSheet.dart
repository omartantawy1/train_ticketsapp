import 'package:flutter/material.dart';

TextEditingController? controller;

class destinationBottomSheet extends StatefulWidget {
  destinationBottomSheet(TextEditingController? _cont) {
    controller = _cont;
  }

  @override
  State<destinationBottomSheet> createState() =>
      _destinationBottomSheetState(controller);
}

String valuet = "";

Object? st;

void setval(String _value) {
  controller?.text = _value;
}

class _destinationBottomSheetState extends State<destinationBottomSheet> {
  _destinationBottomSheetState(TextEditingController? con) {
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
                  title: Text("Ramses"),
                  onChanged: (val) {
                    setval("Ramses");
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
                  title: Text("Banha"),
                  onChanged: (val) {
                    setval("Banha");
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
                  title: Text("Sidi Gaber"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Sidi Gaber");

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
                  title: Text("Matrouh"),
                  onChanged: (val) {
                    setval("Matrouh");

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
                  title: Text("Port Said"),
                  onChanged: (val) {

                    setval("Port Said");

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
                  title: Text("Mansoura"),
                  onChanged: (val) {
                    setval("Mansoura");

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
                  title: Text("Louxor"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Louxor");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 8,
                  groupValue: st,
                  title: Text("Kafr Elzayat"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Kafr Elzayat");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 9,
                  groupValue: st,
                  title: Text("Assuit"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Assuit");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 10,
                  groupValue: st,
                  title: Text("Sohag"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Sohag");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 11,
                  groupValue: st,
                  title: Text("Suez"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Suez");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 12,
                  groupValue: st,
                  title: Text("Zagazig"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Zagazig");

                    setState(() {
                      if (st != val) {
                        st = val;
                      }
                    });
                  },
                  activeColor: Colors.red,
                ),
                RadioListTile(
                  value: 13,
                  groupValue: st,
                  title: Text("Beni Suef"),
                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    setval("Beni Suef");

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
