import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project5/smartdevice_box.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final double horizontalpadding=40;
final double verticalpadding=25;

List mysmartdevices=[
  ["Smart AC",'assets/images/air-conditioner.png',false],
  ["Smart Fan", 'assets/images/fan.png',false],
  ["Smart Light", 'assets/images/light-bulb.png',false],
  ["Smart TV",'assets/images/smart-tv.png',false]
];


void powerswitchchanged(bool value,int index){
    setState(() {
      mysmartdevices[index][2]=value;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: horizontalpadding,
                vertical: verticalpadding
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset('assets/images/menu.png',
                height: 45,
                color: Colors.grey.shade800,
                ),
              
                Icon(Icons.person,size: 45,color: Colors.grey.shade700,)
              
                ],
              ),
            ),

            const SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("Welcome Home",
                  style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
              Text("AKASH TYAGI",
              style:TextStyle(fontFamily: 'gang',fontSize: 55,fontWeight: FontWeight.w500)
              )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Divider(
                color: Colors.grey[400],
              thickness: 1
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text("Smart Devices",style: TextStyle(fontSize: 24,color: Colors.grey.shade800),),
            ),

            Expanded(child: GridView.builder(
              itemCount: mysmartdevices.length,
               physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3
                ),
             itemBuilder: (context,index){
              return smartdevicebox(
                smartdevicename: mysmartdevices[index][0],
                iconpath: mysmartdevices[index][1],
                powerOn: mysmartdevices[index][2],
                onChanged: (value)=> powerswitchchanged(value,index),
              );
             }
             )
             )
          ],
        ),
      ),
    );
  }
}