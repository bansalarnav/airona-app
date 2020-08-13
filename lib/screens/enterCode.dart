import 'package:flutter/material.dart';
import 'package:xino_hackathon/screens/chatscreen.dart';
import 'package:xino_hackathon/screens/home.dart';

class CodeScreen extends StatefulWidget {
  final String code;
  final String crewCode;
  CodeScreen(this.code, this.crewCode);
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  var enteredCode = '';
  var seatnum = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffa36c),
        centerTitle: true,
        title: Text(
          'Enter Code',
          style: TextStyle(fontFamily: 'Inter', fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()))
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'After you had booked your tickets you would have been given a code. Enter that Code along with your Seat No. below- ',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff948C8C)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              TextFormField(
                onChanged: (val) => {seatnum = val},
                initialValue: seatnum,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Color(0xffff5e00)),
                cursorColor: Color(0xffffa36c),
                decoration: InputDecoration(
                  labelText: 'Seat No.',
                  labelStyle:
                      TextStyle(fontFamily: 'Inter', color: Color(0xffffa36c)),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Color(0xffffa36c), width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xffffa36c),
                      //width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) => {enteredCode = val},
                initialValue: enteredCode,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Color(0xffff5e00)),
                decoration: InputDecoration(
                  labelText: 'Code',
                  labelStyle:
                      TextStyle(fontFamily: 'Inter', color: Color(0xffffa36c)),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Color(0xffffa36c), width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xffffa36c),
                      //width: 2.0,
                    ),
                  ),
                ),
                cursorColor: Color(0xffffa36c).withRed(255),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              GestureDetector(
                onTap: () => {
                  if (seatnum == '')
                    {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  'Error!',
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontSize: 26),
                                ),
                                content: Text(
                                  'Enter a Seat Number!',
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontSize: 20),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          color: Color(0xffffa36c),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ))
                    }
                  else
                    {
                      if (enteredCode == widget.code)
                        {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => ChatScreen(seatnum, enteredCode)))
                        }
                      else if (enteredCode == widget.crewCode)
                        {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => ChatScreen('The+Crew', enteredCode)))
                        }
                      else
                        {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Error!',
                                      style: TextStyle(
                                          fontFamily: 'Inter', fontSize: 26),
                                    ),
                                    content: Text(
                                      'Invalid Flight Code!',
                                      style: TextStyle(
                                          fontFamily: 'Inter', fontSize: 20),
                                    ),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CodeScreen(widget.code,
                                                          widget.crewCode)));
                                        },
                                        child: Text(
                                          'RETRY',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 16,
                                              color: Color(0xffffa36c),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ))
                        }
                    }
                },
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(88),
                    color: Color(0xffffa36c),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
