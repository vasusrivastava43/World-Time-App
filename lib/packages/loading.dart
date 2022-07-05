import 'package:flutter/material.dart';
import 'package:flutter_4_world_time/packages/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
  Future<void> setuptime() async{
    Worldtime instance = Worldtime(flag: 'germeny.png', location: 'berlin', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
    'location':instance.location,
    'time':instance.time,
    'flag':instance.flag,});
  }
  void initState(){
    super.initState();
      setuptime().then((_) => print('hi'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Text(time),
        ),
      ),

    );
  }
}
