import 'package:flutter/material.dart';
import 'package:worldtimeapp/package/home.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Việt Nam', flag: 'Berlin.jpg', url: 'Asia/Ho_Chi_Minh');
    await instance.getTime();
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const Home(),
        settings: RouteSettings(
          arguments: {
            'location': instance.location,
            'flag': instance.flag,
            'time': instance.time,
            'isDayTime': instance.isDayTime,
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size:100.0,
          ),

        )
    );
  }
}
