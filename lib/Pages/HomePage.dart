import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/HexToColor.dart';
import 'package:hostel_wise/Util/HomeCarosal.dart';

import '../Util/httpCalls.dart';

class HomePage extends StatefulWidget {
  HomePage(this.ResponseBody);
  final ResponseBody;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String secKey = '';
  String Name = '';
  String RegNo = '';
  String Room = ''; // Declare Name as a class member variable

  @override
  void initState() {
    super.initState();
    secKey = widget.ResponseBody["SECRETKEY"];
    _getData();
  }

  Future<void> _getData() async {
    final url = "$httpUrl/dashboard/$secKey/Z/";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 202) {
      final data = jsonDecode(response.body);
      setState(() {
        Name = data["s_Name"];
        RegNo = data["s_Registration_Number"];
        Room = data["s_Room_Number"]; // Update the Name variable
      });
      print(response.body);
    } else {
      print("${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuBar(children: []),
              )),
          child: Container(
            margin: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: HexColor("#FFEAD2")),
          ),
        ),
        backgroundColor: HexColor("#637892"),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),
      ),
      body: Stack(
        children: [
          Container(
            color: HexColor("#637892"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#F7F7F7"),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
            child: Column(
              children: [
                SizedBox(height: 27),
                Text(
                  "Notice Board",
                  style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#637892")),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: HexColor("#DBDFEA")),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Name),
                      Text(RegNo),
                      Text(Room),
                    ],
                  ),
                ),
                HomeCarosal(secKey)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
