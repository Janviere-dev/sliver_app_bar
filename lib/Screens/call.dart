import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final List<String> names = const [
    "Udo", "Emmanuel", "Jonathan",
    "Buke", "Grace", "Bode",
    "Maurice", "Joseph", "Chipo",
    "Kelvin", "Loice", "King",
    "Davy", "Fadhili", "Habeeb",
    "Towi", "Ibrahim", "Larry",
    "Kofi", "Joshua", "Harmony",
    "Linda", "Janviere"
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: true,
            // snap: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            leading: const Icon(Icons.menu, color: Colors.white),
            actions: [
              IconButton(icon: const Icon(Icons.add), onPressed: () {}),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 20),
              title: const Text(
                "Call",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Container(
                color: Colors.deepPurple,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.purple[50] : Colors.white54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      names[index % names.length][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(names[index % names.length]),
                  subtitle: const Text("Hey, How are you!"),
                ),
              ),
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}
