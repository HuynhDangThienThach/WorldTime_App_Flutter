import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
    //--- Khai báo các thuộc tính về worldTime
    String location;    //--- name of Nation
    String time ="";        //--- Time of Nation
    String flag;        //--- Url icon Nation
    String url;         //--- Url api nation
    bool ? isDayTime;
    WorldTime({required this.location, required this.flag, required this.url});

   Future <void> getTime() async {
     try{
       //--- Make the Request
       Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
       Map data = jsonDecode(response.body);
       // print(data);
       //--- Get propeties from data

       String datime = data['datetime'];
       String offset = data['utc_offset'].substring(1,3);
       // print(datime);
       // print(offset);

       //---Create Datime object
       DateTime now = DateTime.parse(datime);
       now = now.add(Duration(hours: int.parse(offset)));

       //--- Thuộc tính thời gian (time)
       isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
       time = DateFormat.jm().format(now);
     }
     catch(e){
       print('caught error: $e');
       time = 'Không thể lấy dữ liệu thời gian';
     }
    }
}
