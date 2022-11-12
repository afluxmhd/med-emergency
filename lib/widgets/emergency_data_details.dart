import 'package:flutter/material.dart';
import 'package:reva_doc/data/hospital_data.dart';

class EmergencyDataDetails extends StatelessWidget {
  const EmergencyDataDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text("Location Detected: ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            Text("REVA UNIVERSITY",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text("Nearest Hospital: ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            Text(AppData().hospitalDatas[0],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ],
        ),
        Row(
          children: const [
            Text("Driver Name: ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            Text("Rajesh KR",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ],
        ),
        Row(
          children: const [
            Text("Vehicle Details: ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            Text("KA 15 AB 2867",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
