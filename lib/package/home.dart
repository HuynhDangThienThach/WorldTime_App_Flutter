import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  Map data ={};

  @override
  Widget build(BuildContext context) {
    //--- Xét điều kiện nếu data được lưu mà trống thì lấy dữ liệu cũ còn nếu không trống thì lấy dữ liệu mới
    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //---Set Background
    String bgImage = data['isDayTime'] ? 'day.png': 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800]!;
    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
           child: Padding(
                padding: const EdgeInsets.fromLTRB(0,150,0,0),
                child: Column(
                  children: <Widget> [
                    TextButton.icon(
                        onPressed: () async{
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            //--- Lưu kết quả đã nhận từ choose_location vào data
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDayTime': result['isDayTime'],
                              'flag': result['flag'],
                            };
                          });
                        },
                        icon: const Icon(Icons.edit_location, color: Colors.white,size: 30.0,),
                        label: const Text('Edit location', style: TextStyle(color: Colors.white, fontSize: 15),),
                    ),
                    const SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['location'], style: TextStyle(fontSize: 28.0, letterSpacing: 2.0, color: Colors.grey[200]),),

                      ],
                    ),
                    const SizedBox(height: 15.0,),
                    Text(data['time'], style: TextStyle(fontSize: 66.0, color: Colors.grey[200]),)
                  ],
                ),
              ),
          ),
        ),
    );
  }
}
