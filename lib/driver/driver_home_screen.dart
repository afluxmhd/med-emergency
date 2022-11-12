import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reva_doc/emergency_bloc/emergency_bloc.dart';
import '../widgets/active_driver_emergency_list.dart';
import '../widgets/active_emergency_widget.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

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
                        "Hi Rajesh",
                        style: GoogleFonts.poppins(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "KA 15 AB 2867",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 230, 69, 69),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/5405627.jpg"))),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Emergency List",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<EmergencyBloc, EmergencyState>(
                builder: (context, state) {
                  List<ActiveDriverEmergencyList> activeDriverEmergencyList =
                      state.driverEmergencyList;
                  return Column(
                    children: [
                      activeDriverEmergencyList.isEmpty
                          ? const SizedBox()
                          : activeDriverEmergencyList[0],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
