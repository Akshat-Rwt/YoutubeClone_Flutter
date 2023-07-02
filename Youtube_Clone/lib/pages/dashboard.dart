import 'package:flutter/material.dart';
import 'package:youtube_clone/pages/home.dart';
import './home.dart';
class DashBoard extends StatefulWidget { //This dashboard is a Public class
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> { //This Dashboard is Private Bar

  AppBar  _buildAppBar(){
    return AppBar(
        elevation: 0,
        actions: const [
          Icon(Icons.search , color: Colors.white ,) ,
          SizedBox(
            width: 20,
           ),
           Icon(Icons.cast , color: Colors.white),
           SizedBox(
            width: 20,
           ),
           Icon(Icons.notifications , color: Colors.white),
           SizedBox(
            width: 20,
           )
        ],
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 100,
          child: Image.network('https://freelogopng.com/images/all_img/1656504144youtube-logo-png-white.png')
        
    ));
  }

  List<BottomNavigationBarItem>  _getItems(){
   return const [
        BottomNavigationBarItem(icon: Icon(Icons.home) , label:'Home' ),
        BottomNavigationBarItem(icon: Icon(Icons.subscriptions) , label:'Subscriptions' ),
        BottomNavigationBarItem(icon: Icon(Icons.library_add) , label:'Library' )
      ];
    
  } 

List<Widget>  _screens(){
    return [ Home() ,
     Text('Subscriptions') ,
     Text('Library') ] ;
    
    

  }
  int index = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens()[index], //Index is work like a 0 -> Home | 1-> Subscription | 2-> Library
      appBar: _buildAppBar(),
      bottomNavigationBar: 
      BottomNavigationBar(
        onTap: (int currentIndex){
          index = currentIndex;
          setState(() {});
        },
        currentIndex: index ,
        items: _getItems()),
    );

  }
}