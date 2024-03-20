import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> childernName = ["Amit", "Ankit", "lokesh", "Nitin", "Mukesh"];
  List<String> filteredNameList = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredNameList.addAll(childernName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                filterfun(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: "Search",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredNameList.length,
                itemBuilder: (BuildContext context, index) {
                  return Text(filteredNameList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void filterfun(String filter_string) {
    List<String> filteredItems = [];

    if (filter_string.isNotEmpty) {
      childernName.forEach((item) {
        if (item.toLowerCase().contains(filter_string.toLowerCase())) {
          filteredItems.add(item);
        }
      });
      setState(() {
        filteredNameList.clear();
        filteredNameList.addAll(filteredItems);
      });
    } else {
      setState(() {
        filteredNameList.clear();
        filteredNameList.addAll(childernName);
      });
    }
  }
}
