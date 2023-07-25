import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/HexToColor.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 604,
          decoration: BoxDecoration(
              color: HexColor("#637892"),
              border: Border.fromBorderSide(BorderSide(
                  color: HexColor("#ACB1D6"),
                  width: 12,
                  strokeAlign: BorderSide.strokeAlignOutside)),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(350))),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/Icons/vasu.png"),
                      radius: 50,
                      backgroundColor: HexColor("#F7F7F7"),
                      child:
                          ClipOval(child: Image.asset("assets/Icons/vasu.png")),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Vasu Somani",
                      style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 1,
                    color: HexColor("#F7F7F7"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: HexColor("#F7F7F7")),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Settings",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: HexColor("#F7F7F7")),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                              color: HexColor("#F7F7F7")),
                        )),
                  ),
                ),
                SizedBox(height: 175),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Transform.rotate(
                    angle: 3.1415, // 180 degrees in radians
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.exit_to_app_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
