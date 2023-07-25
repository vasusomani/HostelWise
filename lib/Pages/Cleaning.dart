import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/httpCalls.dart';
import 'package:http/http.dart' as http;
import '../Util/HexToColor.dart';
import 'RequestSent.dart';

class CleaningRequestPage extends StatelessWidget {
  CleaningRequestPage(this.secKey);
  final String secKey;
  @override
  Widget build(BuildContext context) {
    // Future<void> _submitRequest() async {
    //   final body = jsonEncode({"completed": true, "cleaner_ID": "123"});
    //   final url =
    //       "https://0879-136-233-9-98.ngrok-free.app/dashboard/$secKey/A/";
    //   final uri = Uri.parse(url);
    //   final response = await http.put(uri, body: body);
    //   if (response.statusCode == 200) {
    //     final ResponseBody = jsonDecode(response.body);
    //     print(response.body);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => RequestSent(),
    //         ));
    //   } else {
    //     print("${response.statusCode}");
    //   }
    // }
    // Future<void> _submitRequest() async {
    //   final url =
    //       "https://0879-136-233-9-98.ngrok-free.app/dashboard/$secKey/A/";
    //   final uri = Uri.parse(url);
    //   final response = await http.get(uri);
    //   if (response.statusCode == 200) {
    //     final ResponseBody = jsonDecode(response.body);
    //     print(response.body);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => RequestSent(),
    //         ));
    //   } else {
    //     print("${response.statusCode}");
    //   }
    // }
    Future<void> _submitRequest() async {
      final body = {};
      final url = "$httpUrl/dashboard/$secKey/A/";
      final uri = Uri.parse(url);
      final response = await http.post(uri, body: body);
      if (response.statusCode == 201) {
        final ResponseBody = jsonDecode(response.body);
        print(response.body);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestSent(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestSent(),
            ));
        print("${response.statusCode}");
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            color: HexColor("#637892")),
                      ),
                      Container(
                        height: 70,
                      )
                    ],
                  ),
                  Container(
                    height: 220,
                    child: Image.asset(
                      "assets/Icons/Cleaning.png",
                      scale: 0.7,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: HexColor("#FFEAD2")),
                  )
                ],
              ),
              SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Request                Cleaning",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#637892")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Effortlessly request room cleaning at your preferred time slot without the hassle of contacting and coordinating with cleaners. Simplify the process and enjoy a clean and tidy hostel room on your terms.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(282, 46)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#D9D9D9"))),
              onPressed: null,
              child: const Text(
                "Select preferred time slot",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(282, 46)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#D9D9D9"))),
              onPressed: _submitRequest,
              child: const Text(
                "Request",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
