import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewHome extends StatefulWidget {
  final Function() clearData;
  final Function() setData;
  const ListViewHome({Key? key, required this.clearData, required this.setData}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  List<String> passedNames = [];

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      passedNames = prefs.getStringList('passedNames')!;
      print(passedNames);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff07d33),
          title: Text("Matches"),
        ),
        body: Container (
          child: Column(
            children: [
              Scrollbar(
                thumbVisibility: true,
                thickness: 10, //width of scrollbar
                radius: Radius.circular(20), //corner radius of scrollbar
                child: SingleChildScrollView(
                  child:  SizedBox(
                    height: 650,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: passedNames?.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (passedNames != null) {
                          return ListTile(
                              title: Text(passedNames![index]),
                              subtitle: Text("The battery is full."),
                              leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                              trailing: Icon(Icons.star));
                        }
                      },
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(
                      width: 2,
                      color: Colors.black
                  ),
                ),
                onPressed: () async {
                  widget.clearData();
                  widget.setData();
                  Navigator.pop(context);
                },
                child: Text('Clear'),
              )
            ],
          ),
        ),
      );
  }
}
