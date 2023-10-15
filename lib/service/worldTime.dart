// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
class WorldTime{
 String location='';
  String?flag;
  String?url;
  String time='';
  bool?isDaytime;
  String? correct_date;


  WorldTime({required this.location,this.flag,this.url});


 Future<void> getTime() async {
   try {
     Response response = await get(
         Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
     Map data = jsonDecode(response.body);

     String datetime = data['datetime'];
    DateTime date=DateTime.parse(datetime.substring(0,10));
     correct_date=formatDate(date, [dd,'-',mm,'-',yyyy]);



     DateTime now = DateTime.parse(datetime.substring(0,26));


     isDaytime=now.hour >6 && now.hour <20? true:false;
     time =DateFormat.jm().format(now) ;

   }

   catch (e) {
     time='could not get time data';
   }
 }
 }
