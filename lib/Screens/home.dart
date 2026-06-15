import 'package:flutter/material.dart';
import 'package:sliver_app_bar/Screens/call.dart';
import 'package:sliver_app_bar/Screens/message.dart';
import 'package:sliver_app_bar/Screens/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> names = const[
  "Udo", "Emmanuel", "Jonathan", 
  "Buke", "Grace", "Bode", 
  "Maurice", "Joseph", "Chipo",
  "Kelvin", "Loice", "King", 
  "Davy", "Fadhili", "Habeeb",
  "Towi","Ibrahim", "Larry", 
  "Kofi","Joshua", "Harmony",
  "Linda","Janviere"
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Static AppBar"), // The problem AppBar
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        
        

        // Action icons 
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(38),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                _chip("All", true),
                _chip("Unread", false),
                _chip("Favorites", false),
                _chip("Groups", false),
              ],
            ),
          ),
          ),
      ),
      drawer:Drawer(),
      
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
             color: index % 2 == 0 ? Colors.purple[50]: Colors.white54,
             borderRadius: BorderRadius.circular(8)
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text(
                names[index % names.length][0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(names[index% names.length]),
            subtitle: Text("Hey, How are you!"),
          ),
        ),
      ),

    // body: ListView.builder(
    //   itemCount: 31,
    //   itemBuilder: (context, index) {
        
    //     if (index == 0) {
    //       return SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //         child: Row(
    //           children: [
    //             _chip('All', true),
    //             _chip('Unread', false),
    //             _chip('Favorites', false),
    //             _chip('Groups', false),
    //           ],
    //         ),
    //       );
    //     }

    //     final personIndex = index - 1;
    //     return Container(
    //       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    //       decoration: BoxDecoration(
    //          color:  personIndex % 2 == 0 ? Colors.purple[50]: Colors.white54,
    //          borderRadius: BorderRadius.circular(8)
    //       ),
    //       child: ListTile(
    //         leading: CircleAvatar(
    //           backgroundColor: Colors.deepPurple,
    //           child: Text(
    //             names[ personIndex % names.length][0],
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //         title: Text(names[ personIndex% names.length]),
    //         subtitle: Text("Hey, How are you!"),
    //       ),
    //     );
    //   },
    // ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index );
          if (index == 1) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CallScreen()),
            );
          }

          if (index == 2) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Message()),
            );
          }

          if (index == 3) {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NotificationScreen() ),
            );
          }
        } ,


        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),


        ],
        
      )
    );
  }

  Widget _chip(String label, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple[200] : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color:Colors.white,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
            ),
          ),
        );
      }
  }
  
