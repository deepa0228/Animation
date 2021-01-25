import 'package:animation/anim/chain_anim.dart';
import 'package:animation/anim/counter_animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Animations'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage>
 with SingleTickerProviderStateMixin
{
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds:1800),
      vsync: this);
      animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
      animation.addStatusListener((status) {
        if(status == AnimationStatus.completed){
          controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          controller.forward();
        }
      });
      controller.forward();
    // controller = new AnimationController(
    //   duration: const Duration(milliseconds:1800),
    //   vsync: this);
    //   animation = new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
    //   ..addListener(() { //cascading instead of animation.addlisten we are using .. syntax which is faster
    //     setState(() {
    //       debugPrint("Running..${animation.value}");
    //     });
    //   });
      // controller.forward();
    
  }
  @override
  Widget build(BuildContext context) {
    // return ChainAnimation(animation: animation,);
    return Scaffold(

      body: ChainAnimation(animation: animation,),
    );
  }

}



    
  


    

