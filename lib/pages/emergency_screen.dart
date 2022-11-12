import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reva_doc/pages/emergency_splash_screen.dart';
import 'package:reva_doc/widgets/active_emergency_widget.dart';
import '../emergency_bloc/emergency_bloc.dart';
import '../widgets/emergency_data_details.dart';

class EmergencyScreen extends StatefulWidget {
  EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  bool isLoading = true;

  void loadingData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 69, 69),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Emergency\nServices",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 170,
              ),
              isLoading
                  ? EmergencySplashScreen()
                  : const EmergencyDataDetails(),
              const SizedBox(height: 270),
              isLoading
                  ? Container(
                      height: 60,
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text('Proceed',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 28)),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        context.read<EmergencyBloc>().add(
                            AddDriverEmergencyList(
                                activeDetail: const ActiveEmergencyList()));
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 450,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text('Proceed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28)),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
