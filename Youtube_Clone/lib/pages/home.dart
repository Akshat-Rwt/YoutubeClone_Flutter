import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:youtube_clone/pages/player.dart';
import 'package:youtube_clone/services/api_client.dart';
import 'package:timeago/timeago.dart'as timeago;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: _apiClient.getVideos(),

      builder: (BuildContext ctx , AsyncSnapshot<dynamic> snapShot){

      if(!snapShot.hasData){
        return const Center(child: CircularProgressIndicator());
      }

      else if(snapShot.hasError){
        return Center(child: Text('Something Went Wrong...'),
        );
      }

      else{
        print("Data Coming....");
        //print(snapShot.data['items']);
        return ListView.builder(
          itemCount: snapShot.data.length,
          itemBuilder: (c,int index){

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Player(snapShot.data[index]['id']))
                    );
                  },
                  child: Image.network(snapShot.data[index]['snippet']['thumbnails']['high']['url'])),
              Row(
                children:[
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://www.shareicon.net/data/512x512/2015/09/18/103160_man_512x512.png'),
          
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    snapShot.data[index]['snippet']['title'],
                  // .toString()
                  // .substring(0,20)
                  maxLines : 2 ,
                  overflow: TextOverflow.ellipsis,
                  ),
                )
                
              ],
              ),
          
              Padding(
                padding: const EdgeInsets.only(left:60),
                child: Row(children: [
                  Text(Numeral(int.parse(snapShot.data[index]['statistics']['viewCount'])) 
                  .format()),

                  SizedBox(width:20),

                  Text(timeago.format(
                    DateTime.parse(snapShot.data[index]['snippet']
                  ['publishedAt']
                  .toString())))
              
                ],
                ),
              )
          
              ],
            ),
          );

        });
      }
    });

  }
}