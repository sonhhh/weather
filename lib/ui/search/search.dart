import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather/api/data/results.dart';

import 'package:weather/ui/search/search_provider.dart';

class Search extends StatefulWidget {
   Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();
late SearchProvider searchProvider;
  bool hasPopped = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    textController = TextEditingController();
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
              Result firstResult = value.result.first;
              double? latitude = firstResult.latitude;
              double? longitude = firstResult.longitude;
              (double? lat, double? lon, String? city) queryResult = (latitude, longitude, firstResult.name);
              if(context.mounted){
                hasPopped = true;
                Navigator.pop(context, queryResult);}
            },
              icon: const Icon(Icons.search),
              key: const Key("searchPage_search_iconButton"),)
          ]);
        },
        ));
  }

}

