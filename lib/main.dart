import 'package:cookies_store/cookie-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './models/cookie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MilkyMakers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final cookieList = cookies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.hexToColor('#FCFBFD'),
      appBar: AppBar(
        backgroundColor: widget.hexToColor('#E3097C'),
        leading: Icon(
          Icons.menu,
          size: 23,
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
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              'Start picking your treats',
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            width: double.infinity,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: <Widget>[
                ...cookieList.map((meal) {
                  return _buildCookieGrid(meal);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCookieGrid(Cookie cookie) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CookieDetailsScreen(cookie),
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: 200,
              color: widget.hexToColor('#FFFDFF'),
            ),
            Positioned(
              top: 140,
              left: 65,
              child: Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.75),
                      blurRadius: 10,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Hero(
                tag: cookie.id,
                child: Container(
                  height: 130,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/cookie-${cookie.id}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
                  height: 110,
                  width: 200,
                  child: Text(
                    cookie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
            ),
            Positioned(
              top: 190,
              child: Container(
                  height: 30,
                  width: 200,
                  child: Text(
                    '\$${cookie.amount.toString()}',
                    style: TextStyle(
                      color: widget.hexToColor('#E3097C'),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
