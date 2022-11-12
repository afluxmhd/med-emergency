import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reva_doc/widgets/active_emergency_widget.dart';

import '../emergency_bloc/emergency_bloc.dart';

class ActiveDriverEmergencyList extends StatelessWidget {
  const ActiveDriverEmergencyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const Text("Mohammed Aflah",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 27)),
              const SizedBox(
                height: 2,
              ),
              const Text("Reva University",
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
                      return Row(
                        children: [
                          Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: state.patientEmergencyList.isEmpty
                                ? InkWell(
                                    onTap: () {
                                      context.read<EmergencyBloc>().add(
                                          AddPatientEmergencyList(
                                              activeDetail:
                                                  const ActiveEmergencyList()));
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                      "Activated",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          state.patientEmergencyList.isEmpty
                              ? const SizedBox()
                              : Container(
                                  height: 37,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 5, 228, 235),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Track",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
