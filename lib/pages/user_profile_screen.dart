import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reva_doc/driver/driver_main_screen.dart';
import 'package:reva_doc/pages/edit_detail_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 230, 69, 69),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/5939837.jpg"))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Aflaah",
              style: GoogleFonts.poppins(
                  fontSize: 32, fontWeight: FontWeight.w600),
            ),
            Text(
              "R21DA030",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 50,
            ),
            UserProfileItems(
              label: "Edit Profile",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditUserScreen()));
              },
              icon: Icons.edit,
            ),
            UserProfileItems(
              label: "More Information",
              onTap: () {},
              icon: Icons.info,
            ),
            UserProfileItems(
              label: "Logout",
              onTap: () {},
              icon: Icons.person,
            ),
            UserProfileItems(
              label: "Switch to Ambulance App",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DriverMainScreen()));
              },
              icon: Icons.medical_services,
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileItems extends StatelessWidget {
  const UserProfileItems({
    Key? key,
    required this.label,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final String label;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.black,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(label,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 0.2,
                            wordSpacing: 0,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
