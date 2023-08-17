import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:weather/api/data/results.dart';

=======
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
import 'package:weather/ui/search/search_provider.dart';

class Search extends StatefulWidget {
   Search({super.key});

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
<<<<<<< HEAD
    textController = TextEditingController();
=======
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
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
<<<<<<< HEAD
=======
                   //     searchProvider.search(searchKey);
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
                      },
                      decoration: const InputDecoration(
                          labelText: 'City'
                      ),
                    )
                )),
            IconButton(onPressed: () async {
              String cityName = textController.text;
<<<<<<< HEAD
              await value.search(cityName);
              Result firstResult = value.result.first;
              double? latitude = firstResult.latitude;
              print(latitude);
              double? longitude = firstResult.longitude;
              print(longitude);
              (double? lat, double? lon, String? city) queryResult = (latitude, longitude, firstResult.name);
              // double? fetchedLatitude = searchProvider.fetchedLatitude;
              // double? fetchedLongitude = searchProvider.fetchedLongitude;
              if(context.mounted) Navigator.pop(context, queryResult);
              //await fetchWeatherData(latitude, longitude);
=======
             await value.search(cityName);
               Navigator.pop(context, cityName);
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
            },
              icon: const Icon(Icons.search),
              key: const Key("searchPage_search_iconButton"),)
          ]);
        },
        ));
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
