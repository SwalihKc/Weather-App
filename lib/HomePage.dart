import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> time = ['12:00', '11:35', '12:24', '12:57', '1:30'];

List<String> weatherHistory = ['18ºC', '20ºC', '26ºC', '16ºC', '18ºC'];

class _MyHomePageState extends State<MyHomePage> {
  bool switchValue = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
          leading: Switch(
            value: switchValue,
            onChanged: (value) {},
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 40,
            )
          ],
          backgroundColor: const Color.fromARGB(255, 4, 157, 228)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  'Malappuram',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const Text(
              '20 October,friday 2023',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Image.asset('assets/Sun cloud angled rain.png'),
            const Text(
              '18ºC',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 80,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(0, 30, 30, 31).withAlpha(40),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.waterfall_chart_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        '1%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.thermostat_sharp, color: Colors.white),
                      Text(
                        '19%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.air_rounded, color: Colors.white),
                      Text(
                        '17 km/h',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Next 24 hours',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(0, 30, 30, 31)
                                .withAlpha(40),
                          ),
                          child: Column(
                            children: [
                              Text(time[index]),
                              Image.asset('assets/sun.png'),
                              Text(weatherHistory[index])
                            ],
                          ),
                        ),
                      ),
                      itemCount: 5,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Next 7 days',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(225, 88, 145, 184),
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location_solid), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
