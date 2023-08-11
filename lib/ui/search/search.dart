import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/ui/search/search_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();
late SearchProvider searchProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
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
        body: Consumer<SearchProvider>(builder: (context, value, child) {
          return Row(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: textController,
                      onChanged: (searchKey) {
                   //     searchProvider.search(searchKey);
                      },
                      decoration: const InputDecoration(
                          labelText: 'City'
                      ),
                    )
                )),
            IconButton(onPressed: () async {
              String cityName = textController.text;
             await value.search(cityName);
               Navigator.pop(context, cityName);
            },
              icon: const Icon(Icons.search),
              key: const Key("searchPage_search_iconButton"),)
          ]);
        },
        ));
  }
}