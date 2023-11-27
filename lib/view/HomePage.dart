import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/ThemChange.dart';
import 'package:weather_app/model/forcastModel.dart';
import 'package:weather_app/model/model_class.dart';
import 'package:weather_app/utility/Text_Widget.dart';
import 'package:weather_app/utility/service.dart';
import 'package:weather_app/utility/ssssss.dart';
import 'package:weather_app/viewmodel/fetchDataInternet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var size, height, width;
  bool switchValue = false;
  String cityy = '';
  var searchController = TextEditingController();

  Widget build(BuildContext context) {
    //  final prov= Provider.of<ThemeProvider>(context);
    var now = DateTime.now();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          centerTitle: true,
          // title: appBarTitle,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
          leading: Consumer<ThemeProvider>(builder: (context, prov, c) {
            return Switch(
              value: switchValue,
              onChanged: (value) {
                prov.gettheme();
              },
            );
          }),
          actions: [
            AnimSearchBar(
                color: Theme.of(context).appBarTheme.actionsIconTheme!.color,
                searchIconColor: Theme.of(context).iconTheme.color,
                width: 300,
                textController: searchController,
                onSuffixTap: const Icon(Icons.search),
                onSubmitted: (value) async {
                  cityy = value;

                  await convertingToLatLon(cityy)
                      .then((value) => {addFunction()});
                  setState(() {});
                }),
          ],
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
      body: FutureBuilder(
        future: addFunction(),
        builder: (context, snapshot) {
          return weath == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                color: Theme.of(context).iconTheme.color),
                            customeText(
                                text: weath?.name ?? "",
                                size: 18,
                                weight: FontWeight.w400)
                          ],
                        ),
                        customeText(
                          text: DateFormat.yMMMd().format(now),
                          size: 16,
                          weight: FontWeight.w400,
                        ),
                        weath != null
                            ? Image.network(
                                'https://openweathermap.org/img/wn/${weath?.icon}@2x.png')
                            : const SizedBox(),
                        customeText(
                          text: '${weath?.temp}ºC',
                          size: 30,
                          weight: FontWeight.w400,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: height / 8,
                          width: width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient:
                                  Theme.of(context).colorScheme.background ==
                                          Colors.white70
                                      ? themModel.lightThem
                                      : themModel.darkThem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.waterfall_chart_rounded,
                                      color: Theme.of(context).iconTheme.color),
                                  customeText(
                                      text: '${weath?.humidity}%',
                                      size: 16,
                                      weight: FontWeight.normal)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.thermostat_sharp,
                                      color: Theme.of(context).iconTheme.color),
                                  customeText(
                                      text: '${weath?.pressure} HPA',
                                      size: 16,
                                      weight: FontWeight.normal)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.air_rounded,
                                      color: Theme.of(context).iconTheme.color),
                                  customeText(
                                      text: '${weath?.windspeed} km/h',
                                      size: 16,
                                      weight: FontWeight.normal)
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: customeText(
                                text: 'Next 24 hours',
                                size: 16,
                                weight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 110,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height / 8,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            const Color.fromARGB(224, 6, 9, 14)
                                                .withAlpha(40),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          customeText(
                                              text:
                                                  '${forcastobj?.list?[index].formattedDtTxt}',
                                              size: 12,
                                              weight: FontWeight.normal),
                                          forcastobj != null
                                              ? Image.network(
                                                  'https://openweathermap.org/img/wn/${forcastobj?.list?[index].weather[0].icon}@2x.png',
                                                  scale: 2,
                                                )
                                              : const SizedBox(),
                                          customeText(
                                              text:
                                                  '${forcastobj?.list?[index].main.temp}º',
                                              size: 12,
                                              weight: FontWeight.normal)
                                        ],
                                      ),
                                    ),
                                  ),
                                  itemCount: 8,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: customeText(
                              text: 'Next 5 Days',
                              size: 16,
                              weight: FontWeight.normal),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 2,
                              height: height / 10,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/raining (1).png',
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  customeText(
                                      text:
                                          '${forcastobj?.list?[index].main.temp} º',
                                      size: 21,
                                      weight: FontWeight.w500),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  customeText(
                                      text: '${forcastobj?.list?[index].dtTxt}',
                                      size: 15,
                                      weight: FontWeight.w400)
                                ],
                              ),
                            ),
                          ),
                          itemCount: 5,
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
