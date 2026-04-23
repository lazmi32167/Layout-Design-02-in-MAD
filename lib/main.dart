import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final regController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();

  String bloodGroup = "A+";
  String gender = "";

  Map<String, String> submittedData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Submission")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Form(
              key: _formKey,
              child: Column(
                children: [

                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) =>
                        value!.isEmpty ? "Enter name" : null,
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: rollController,
                          decoration:
                              const InputDecoration(labelText: "Roll"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter roll" : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: regController,
                          decoration: const InputDecoration(
                              labelText: "Registration"),
                          validator: (value) =>
                              value!.isEmpty ? "Enter reg" : null,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  
                  DropdownButtonFormField(
                    value: bloodGroup,
                    items: ["A+", "B+", "O+", "AB+"]
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        bloodGroup = value!;
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: "Blood Group"),
                  ),

                  const SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Gender"),
                      Row(
                        children: [
                          Radio(
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          const Text("Male"),
                          Radio(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          const Text("Female"),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: phoneController,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: aboutController,
                    decoration:
                        const InputDecoration(labelText: "About Me"),
                    maxLines: 3,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          submittedData = {
                            "Name": nameController.text,
                            "Roll": rollController.text,
                            "Registration": regController.text,
                            "Blood": bloodGroup,
                            "Gender": gender,
                            "Phone": phoneController.text,
                            "About": aboutController.text,
                          };
                        });

                        nameController.clear();
                        rollController.clear();
                        regController.clear();
                        phoneController.clear();
                        aboutController.clear();
                        gender = "";
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            if (submittedData.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: submittedData.entries.map((entry) {
                    return Text(
                      "${entry.key}: ${entry.value}",
                      style: const TextStyle(fontSize: 16),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}