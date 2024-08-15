import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
class Choose_location extends StatefulWidget {
  const Choose_location({super.key});

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag:'Berlin.png' , url: 'Europe/Berlin' ),
    WorldTime(location: 'London', flag:'London.png' , url: 'Europe/London' ),
    WorldTime(location: 'Paris', flag:'Paris.png' , url: 'Europe/Paris' ),
    WorldTime(location: 'New_York', flag:'New_York.webp' , url: 'America/New_York' ),
    WorldTime(location: 'Sydney', flag:'Sydney.png' , url: 'Australia/Sydney' ),
    WorldTime(location: 'Tokyo', flag:'Tokyo.jpg' , url: 'Asia/Tokyo' ),
    WorldTime(location: 'Beijing', flag:'Beijing.webp' , url: 'Asia/Shanghai' ),
    WorldTime(location: 'Seoul', flag:'Seoul.png' , url: 'Asia/Seoul' ),
    WorldTime(location: 'Ho Chi Minh', flag: 'SaiGon.webp', url: 'Asia/Ho_Chi_Minh'),
  ];
  void UpdateTime(index) async{
      WorldTime instance = locations[index];
      //--- Thời gian lấy dữ liệu
      await instance.getTime();
      Navigator.pop(context,
        {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDayTime': instance.isDayTime,
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Choose a Location', style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 25.0),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length ,itemBuilder: (context ,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: (){
                UpdateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
      }),
    );
  }
}
