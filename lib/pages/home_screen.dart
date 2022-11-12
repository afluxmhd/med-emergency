import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reva_doc/emergency_bloc/emergency_bloc.dart';
import 'package:reva_doc/pages/emergency_screen.dart';
import 'package:reva_doc/pages/emergency_splash_screen.dart';
import '../widgets/active_emergency_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Aflaah",
                        style: GoogleFonts.poppins(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "R21DA030",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 230, 69, 69),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/5939837.jpg"))),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 160,
                width: 750,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 230, 69, 69),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Emergency Services",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 27)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Connect us for Immediate Help",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16)),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BlocBuilder<EmergencyBloc, EmergencyState>(
                              builder: (context, state) {
                                return Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: state.patientEmergencyList.isEmpty &&
                                          state.driverEmergencyList.isEmpty
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EmergencyScreen()));
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Connect Now",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      : state.driverEmergencyList.isNotEmpty &&
                                              state.patientEmergencyList
                                                  .isNotEmpty
                                          ? Center(
                                              child: Row(
                                                children: const [
                                                  Text(
                                                    "    Activated",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Center(
                                              child: Row(
                                                children: const [
                                                  Text(
                                                    "    Wating",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  EmergencySplashScreen(
                                                    size: 25,
                                                    lowerPadding: 0,
                                                    color: Colors.white,
                                                    loadingColor: Colors.black,
                                                  )
                                                ],
                                              ),
                                            ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<EmergencyBloc, EmergencyState>(
                builder: (context, state) {
                  List<ActiveEmergencyList> emergencyList =
                      state.patientEmergencyList;
                  return Column(
                    children: [
                      emergencyList.isEmpty ? SizedBox() : emergencyList[0]
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
