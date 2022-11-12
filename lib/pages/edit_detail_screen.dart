import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  bool passVisibility = true;
  bool passVisiblitly2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Profile",
              style: GoogleFonts.poppins(
                  fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            TextformFieldWidget(
              labelHint: 'Name',
            ),
            TextformFieldWidget(
              labelHint: 'Srn',
            ),
            TextformFieldWidget(
              labelHint: 'Phone no',
            ),
            TextformFieldWidget(
              labelHint: 'College Name',
            ),
            TextformFieldWidget(
              labelHint: 'Location',
              locationIcon: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(6),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextformFieldWidget extends StatefulWidget {
  TextformFieldWidget(
      {Key? key, required this.labelHint, this.locationIcon = false})
      : super(key: key);

  final String labelHint;
  bool locationIcon;

  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  var location = "Reva University,Bengaluru 583321";

  bool activateController = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: location);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        controller: activateController ? controller : null,
        decoration: InputDecoration(
          suffixIcon: widget.locationIcon
              ? IconButton(
                  tooltip: 'Detect Location',
                  onPressed: () {
                    setState(() {
                      activateController = true;
                    });
                  },
                  icon: const Icon(
                    Icons.location_searching,
                    color: Colors.redAccent,
                  ),
                )
              : null,
          fillColor: const Color(0xffF6F6F6),
          focusColor: const Color(0xffF6F6F6),
          hoverColor: const Color(0xffF6F6F6),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: widget.labelHint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color(0xffE8E8E8).withOpacity(0.4),
                  style: BorderStyle.none)),
        ),
      ),
    );
  }
}
