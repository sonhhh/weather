import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/api/data/welcome.dart';
import 'package:weather/ui/home/home_provider.dart';
import 'package:weather/ui/search/search.dart';
import 'package:weather/ui/setting/setting.dart';

class HomeScreen extends StatefulWidget {
 String? cityName;
 HomeScreen({super.key, this.cityName});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider provider;
  String? cityName;
  @override
  void initState() {
    super.initState();
      provider = Provider.of<HomeProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
            title: const Text('Flutter weather',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const Setting();
                      },));
                    });
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 20,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Search();
                  },)).then((value) {
                    if (value != null) {
                      (double? lat, double? lon, String? city) searchResults = value;
                      CurrentWeather currentWeather = CurrentWeather();
                      Hourly hourly = Hourly();
                      provider.update(searchResults);
                      print(value);
                      provider.fetchWeatherData(searchResults.$1!, searchResults.$2!, currentWeather);
                      provider.hourly(searchResults.$1!, searchResults.$2!, hourly);
                    }
                  });
                },
              icon: const Icon(Icons.search,
                size: 20,
                color: Colors.white,),)
            ]),
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Colors.indigoAccent, Colors.lightBlueAccent],
                  stops: [0, 1],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated)),
          child:  SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Text(
                    homeProvider.result?.$3 ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                  Text(
                  'update: ${homeProvider.currentWeatherUi?.time ?? ''}',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(
                  height: 40,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 74,
                      child: Icon(
                        Icons.sunny,
                        size: 80,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    const SizedBox(width: 40,),
                    Text(
                      "${homeProvider.currentWeatherUi?.temperature ?? ''}",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 20,),
                    const Text("Max: 30\nMin: 25", style: TextStyle(color: Colors.white, fontSize: 15),)
                  ],
                ),
                const Text("Showers",style: TextStyle(fontSize: 30,color: Colors.white),),
      ])));}),
          );






        // child: Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: <Color>[
        //             Colors.indigoAccent, Colors.lightBlueAccent],
        //           stops: [0, 1],
        //           begin: FractionalOffset.topCenter,
        //           end: FractionalOffset.bottomCenter,
        //           tileMode: TileMode.repeated)),
        //   child: const SingleChildScrollView(
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           SizedBox(
        //             height: 120,
        //           ),
        //           Text(
        //             'VietNam',
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //           Text(
        //             'Update: 10:30 AM',
        //             style: TextStyle(color: Colors.white, fontSize: 15),
        //           ),
        //           SizedBox(
        //             height: 40,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               SizedBox(
        //                 height: 74,
        //                 child: Icon(
        //                   Icons.sunny,
        //                   size: 80,
        //                   color: Colors.yellowAccent,
        //                 ),
        //               ),
        //               SizedBox(width: 40,),
        //               Text(
        //                 "35",
        //                 style: TextStyle(
        //                     fontSize: 30,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.white),
        //               ),
        //               SizedBox(width: 20,),
        //               Text("Max: 30 \n Min: 25", style: TextStyle(color: Colors.white, fontSize: 15),)
        //             ],
        //           ),
        //           Text("Showers",style: TextStyle(fontSize: 30,color: Colors.white),)
        //         ]),
        //   ),
        // ),
  }
}
