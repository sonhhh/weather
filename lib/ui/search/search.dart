import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          const Text(
              'City', style: TextStyle(fontSize: 20, color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.indigo,
        ),
        body: Row(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: textController,
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                    decoration: const InputDecoration(
                        labelText: 'City'
                    ),
                  )
              )),
          IconButton(onPressed: () {
            Navigator.pop(context, textController);
          },
            icon: const Icon(Icons.search),
            key: const Key("searchPage_search_iconButton"),)
        ]));

    // child: Row(children: [
    //   Expanded(
    //       child: Padding(
    //     padding: const EdgeInsets.all(8),
    //     child: TextField(
    //       controller: textController,
    //       onChanged: (value) {
    //
    //       },
    //       decoration: const InputDecoration(
    //         labelText: 'City'
    //       ),
    //     )
    //   )),
    //   IconButton(onPressed: (){
    //       Navigator.pop(context, textController);
    //   }, icon: const Icon(Icons.search), key: const Key("searchPage_search_iconButton"), )
    // ]),


  }

}