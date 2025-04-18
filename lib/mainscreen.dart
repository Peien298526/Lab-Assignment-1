import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Random User Information",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(96, 116, 162, 255),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (imageUrl != null)
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(imageUrl!),
                            ),
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            maxLines: 20,
                            controller: controller,
                            readOnly: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Result: ",
                              labelStyle: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(96, 255, 142, 142),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Load Another User"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> onPressed() async {
    var response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      var resparr = json.decode(response.body);
      print(resparr['results']);
      print(resparr['results'][0]['gender']);
      print(resparr['results'][0]['name']['title']);
      print(resparr['results'][0]['name']['first']);
      print(resparr['results'][0]['name']['last']);
      print(resparr['results'][0]['location']['street']['number']);
      print(resparr['results'][0]['location']['street']['name']);
      print(resparr['results'][0]['location']['city']);
      print(resparr['results'][0]['location']['state']);
      print(resparr['results'][0]['location']['country']);
      print(resparr['results'][0]['location']['postcode']);
      print(resparr['results'][0]['location']['coordinates']['latitude']);
      print(resparr['results'][0]['location']['coordinates']['longitude']);
      print(resparr['results'][0]['location']['timezone']['offset']);
      print(resparr['results'][0]['location']['timezone']['description']);
      print(resparr['results'][0]['login']['uuid']);
      print(resparr['results'][0]['login']['username']);
      print(resparr['results'][0]['login']['password']);
      print(resparr['results'][0]['login']['salt']);
      print(resparr['results'][0]['login']['md5']);
      print(resparr['results'][0]['login']['sha1']);
      print(resparr['results'][0]['login']['sha256']);
      print(resparr['results'][0]['dob']['date']);
      print(resparr['results'][0]['dob']['age']);
      print(resparr['results'][0]['registered']['date']);
      print(resparr['results'][0]['registered']['age']);
      print(resparr['results'][0]['phone']);
      print(resparr['results'][0]['cell']);
      print(resparr['results'][0]['id']['name']);
      print(resparr['results'][0]['id']['value']);
      print(resparr['results'][0]['nat']);

      controller.text =
          "Gender: " +
          resparr['results'][0]['gender'] +
          "\n\n" +
          "Name: " +
          "\n" +
          "Title: " +
          resparr['results'][0]['name']['title'] +
          "\n" +
          "First Name: " +
          resparr['results'][0]['name']['first'] +
          "\n" +
          "Last Name: " +
          resparr['results'][0]['name']['last'] +
          "\n\n" +
          "Location: " +
          "\n" +
          "Street Number: " +
          resparr['results'][0]['location']['street']['number'].toString() +
          "\n" +
          "Street Name: " +
          resparr['results'][0]['location']['street']['name'] +
          "\n" +
          "City: " +
          resparr['results'][0]['location']['city'] +
          "\n" +
          "State: " +
          resparr['results'][0]['location']['state'] +
          "\n" +
          "Country: " +
          resparr['results'][0]['location']['country'] +
          "\n" +
          "Postcode: " +
          resparr['results'][0]['location']['postcode'].toString() +
          "\n" +
          "Coordinates: " +
          "\n" +
          "Latitude: " +
          resparr['results'][0]['location']['coordinates']['latitude'] +
          "\n" +
          "Longitude: " +
          resparr['results'][0]['location']['coordinates']['longitude'] +
          "\n" +
          "Timezone: " +
          "\n" +
          "Offset: " +
          resparr['results'][0]['location']['timezone']['offset'] +
          "\n" +
          "Description: " +
          resparr['results'][0]['location']['timezone']['description'] +
          "\n\n" +
          "Email: " +
          resparr['results'][0]['email'] +
          "\n" +
          "UUID: " +
          resparr['results'][0]['login']['uuid'] +
          "\n" +
          "Username: " +
          resparr['results'][0]['login']['username'] +
          "\n" +
          "Password: " +
          resparr['results'][0]['login']['password'] +
          "\n" +
          "Salt: " +
          resparr['results'][0]['login']['salt'] +
          "\n" +
          "MD5: " +
          resparr['results'][0]['login']['md5'] +
          "\n" +
          "SHA1: " +
          resparr['results'][0]['login']['sha1'] +
          "\n" +
          "SHA256: " +
          resparr['results'][0]['login']['sha256'] +
          "\n\n" +
          "DOB: " +
          "\n" +
          "Date: " +
          resparr['results'][0]['dob']['date'] +
          "\n" +
          "Age: " +
          resparr['results'][0]['dob']['age'].toString() +
          "\n\n" +
          "Registered: " +
          "\n" +
          "Date: " +
          resparr['results'][0]['registered']['date'] +
          "\n" +
          "Age: " +
          resparr['results'][0]['registered']['age'].toString() +
          "\n\n" +
          "Phone: " +
          resparr['results'][0]['phone'] +
          "\n" +
          "Cell: " +
          resparr['results'][0]['cell'] +
          "\n" +
          "ID: " +
          "\n" +
          "Name: " +
          resparr['results'][0]['id']['name'] +
          "\n" +
          "Value: " +
          resparr['results'][0]['id']['value'] +
          "\n\n" +
          "Nat: " +
          resparr['results'][0]['nat'];

      setState(() {
        imageUrl = resparr['results'][0]['picture']['large'];
      });
    } else {
      setState(() {
        controller.text = "Error fetching user data";
        imageUrl = null;
      });
    }
  }
}
