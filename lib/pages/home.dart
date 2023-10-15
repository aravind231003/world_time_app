import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage= data['isDaytime']? 'daytime.jpg':'night.jpeg';
    Color? bgColor =data['isDaytime']? Colors.blue:Colors.indigo[700];

    return  Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
                )
              ),
              child: Padding(
                padding:  const EdgeInsets.fromLTRB(0,120,0,0),
                child: Column(
                  children: [
                    TextButton.icon(
                      label:  Text('Location ',
                       style: TextStyle(
                         color: Colors.grey[400],
                       ),
                      ),
                        icon: Icon(Icons.edit_location,
                        color: Colors.grey[400]),
                    onPressed:() async {
                      dynamic result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                           'isDaytime':result['isDaytime'],
                            'flag':result['flag'],
                          'correct_date':result['correct_date']
                        };
                      });
                    }
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        data['location'],
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['correct_date'],
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],

                    ),
                    const SizedBox(height:20),
                    Text(
                      data['time'],
                      style: const TextStyle(
                        fontSize: 66,
                        fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),

                    )
                  ],

                ),
              ),
            )

        )

    );
  }
}

