import 'package:flutter/material.dart';
import 'package:world_time_app/service/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LocationState();
}

class _LocationState extends State<Loading> {
  Future<void> setupWorldtime()  async {
   WorldTime instance=  WorldTime(location: 'Kolkata',flag: 'india',url: 'Asia/Kolkata');
   await instance.getTime();
  Future.delayed(const Duration(seconds: 3),(){
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
       'isDaytime':instance.isDaytime,
      'correct_date':instance.correct_date,
    });

  }) ;
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
      setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: Padding(
            padding:EdgeInsets.all(50),
          child:CircularProgressIndicator() ,
        ),
      ),

    );
  }
}
