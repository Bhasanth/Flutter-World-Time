import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set backgroung image
    String bgi = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bg = data['isDayTime'] ? Colors.grey[200] : Colors.grey[850];
    Color loctext = data['isDayTime'] ? Colors.grey[850] : Colors.white;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgi'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,200.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: loctext,
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: loctext
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
