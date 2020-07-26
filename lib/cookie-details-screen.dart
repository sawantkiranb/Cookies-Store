import 'package:cookies_store/models/cookie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookieDetailsScreen extends StatelessWidget {
  final Cookie cookie;
  CookieDetailsScreen(this.cookie);

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor('#FCFBFD'),
      appBar: AppBar(
        backgroundColor: hexToColor('#E3097C'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'MilkyMakers',
          style: GoogleFonts.montserrat(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              'Start picking your treats',
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                // color: Colors.yellow,
                height: 250,
                width: double.infinity,
              ),
              Positioned(
                top: 245,
                left: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 2 -
                    55,
                child: Container(
                  width: 80,
                  height: 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.75),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/cookie-${cookie.id}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            
            padding: EdgeInsets.only(
              left: 10,
              right: 100,
            ),
            child: Text(
              cookie.title,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 150,
            ),
            child: Text(
              '\$${cookie.amount}',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: hexToColor('#E3097C'),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              cookie.description,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: FlatButton(
              color: hexToColor('#E3097C'),
              onPressed: () {},
              child: Text(
                'ADD TO BAG',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
