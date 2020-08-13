import 'package:flutter/material.dart';
import 'package:xino_hackathon/screens/enterCode.dart';

class FlightCard extends StatefulWidget {
  final String destination;
  final String from;
  final String date;
  final String time;
  final String duration;
  final String code;
  final String crewCode;
  FlightCard(this.destination, this.from, this.duration, this.time, this.date,
      this.code, this.crewCode);
  @override
  _FlightCardState createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.from);
    return GestureDetector(
      onTap: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CodeScreen(widget.code, widget.crewCode)))
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        height: 180,
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 5),
                  color: Color(0xff000000).withOpacity(0.1),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.from} - ${widget.destination}',
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            SizedBox(height: 28),
            Text(
              widget.date,
              style: TextStyle(
                  fontFamily: 'Inter', fontSize: 18, color: Color(0xff535050)),
            ),
            SizedBox(height: 10),
            Text(widget.time,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Color(0xff535050))),
            SizedBox(height: 10),
            Text(
              'Duration - ${widget.duration}',
              style: TextStyle(
                  fontFamily: 'Inter', fontSize: 18, color: Color(0xff535050)),
            )
          ],
        ),
      ),
    );
  }
}
