// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/service/worldTime.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpeg'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(location: 'Dubai',url: 'Asia/Dubai',flag: 'uae.png'),
    WorldTime(location: 'Moscow',url: 'Europe/Moscow',flag: 'moscow.jpeg'),
    WorldTime(location: 'Kolkata',flag: 'india.png',url: 'Asia/Kolkata')
  ];
  void updateTime(index) async {
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
      'correct_date':instance.correct_date
    });


  }

  @override


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
    ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap:(){
                updateTime(index);

                } ,
                title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),

              ),
            ),
          );
        }

      )
    );
  }
}
