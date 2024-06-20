import 'package:aba_app/pages/buscar.dart';
import 'package:aba_app/pages/feed.dart';
import 'package:aba_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url =
      'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

  int _selectedIndex = 0;
  final List<String> appBarTitles = ['Busca', 'Perfil', 'Feed'];

  List<Widget> pages = [
    const Buscar(),
    const Perfil(),
    const Feed(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_selectedIndex]),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(url)),
                accountName: const Text('Aluno Fatec Araras'),
                accountEmail: const Text('aluno@fatec.sp.gov.br'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Buscar',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Perfil',
            selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.calendarCheck),
            label: 'Feed',
            selectedIcon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
          ),
        ],
        // items: const [
        //   BottomNavigationBarItem(
        //     icon: FaIcon(FontAwesomeIcons.calendar),
        //     label: 'Buscar',
        //   ),
        //   // BottomNavigationBarItem(
        //   //   icon: Icon(Icons.calendar_month),
        //   //   label: 'Agenda',
        //   // ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person),
        //     label: 'Perfil',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.feed),
        //     label: 'Feed',
        //   )
        // ],
      ),
    );
  }
}
