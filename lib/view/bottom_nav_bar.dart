import 'package:flutter/material.dart';

import 'nested_json_persing.dart';


class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});
  static const String name = '/main_nav_bar_screen';

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

List<Widget> _screen =
[
  NestedJsonPersing(),
  Center(child: const Text('Updates')),
  Center(child: const Text('Communities')),
  Center(child: const Text('Calls')),

];
int _selectedIndex = 0;

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar:  NavigationBar(
          selectedIndex: _selectedIndex,
          indicatorColor: Color(0x2100F418),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold);
            }
            return const TextStyle(color: Colors.black);
          },
        ),

          onDestinationSelected:(int index){
            _selectedIndex = index;

            setState(() {

            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.chat), label: 'Chates'),
            NavigationDestination(
                icon: Icon(Icons.update_rounded), label: 'Updates'),
            NavigationDestination(
                icon: Icon(Icons.person), label: 'Communities'),
            NavigationDestination(
                icon: Icon(Icons.call), label: 'Calls'),
          ]),
    );

  }




}

