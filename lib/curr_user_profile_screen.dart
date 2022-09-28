import 'package:flutter/material.dart';
import 'package:flutter_project/mentor_user.dart';
import 'package:provider/provider.dart';

import 'calendar.dart';
import 'card_provider.dart';

class CurrProfileScreen extends StatefulWidget {
  CurrProfileScreen({Key? key}) : super(key: key);

  @override
  State<CurrProfileScreen> createState() => _CurrProfileScreenState();
}

class _CurrProfileScreenState extends State<CurrProfileScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Profile"),
        actions: [
          calendarLogo(),
        ],
      ),
      backgroundColor: const Color(0xff3a4738),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          // blurRadius: 10,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/1144/1144760.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Johnny",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Student",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Scrollbar(
                  thumbVisibility: true, //always show scrollbar
                  thickness: 10, //width of scrollbar
                  radius: Radius.circular(20), //corner radius of scrollbar
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        listProfile(Icons.person, "Full Name", "Johnny",
                        ),
                        listProfile(Icons.domain, "School", "-"),
                        listProfile(Icons.female, "Gender", "Male"),
                        listProfile(Icons.phone, "About",
                            "Looking to be a Software Engineer \n."),
                        listProfile(Icons.edit_note_rounded, "Experiences",
                            "- Worked with... \n -Had..."),
                        listProfile(Icons.group, "LinkedIn", "www.linkedin.com/in/nicole-lee/"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarLogo() => IconButton(
    icon: Icon(Icons.calendar_month, size: 30),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Calendar()),
      );
    },
  );

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }}
