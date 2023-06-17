import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController districtController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  FocusNode districtFocusNode = FocusNode();
  FocusNode areaFocusNode = FocusNode();
  FocusNode detailsFocusNode = FocusNode();

  late String district;
  late String area;
  late String details;

  @override
  void initState() {
    district = "Your District";
    area = "Your Area";
    details = "Your Details Address";
    districtController.text = district;
    areaController.text = area;
    detailsController.text = details;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Profile Name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "+880 1111111111",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const Text(
                "profileName@gmail.com",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Address"),
                            content: SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  TextField(
                                      controller: districtController,
                                      focusNode: districtFocusNode,
                                      decoration: InputDecoration(
                                          hintText: "District")),
                                  TextField(
                                      controller: areaController,
                                      focusNode: areaFocusNode,
                                      decoration: InputDecoration(
                                          hintText: "Area/Upozilla/Thana")),
                                  TextField(
                                      controller: detailsController,
                                      focusNode: detailsFocusNode,
                                      decoration: InputDecoration(
                                          hintText: "Details Address")),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                              FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () {
                                    setState(() {
                                      district = districtController.text;
                                      area = areaController.text;
                                      details = detailsController.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Update"))
                            ],
                          ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("${details}, ${area}, ${district}")
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Orders",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Icon(Icons.arrow_forward_ios)
                    ],
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
