import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const MyStapper(),
      }));
}

class MyStapper extends StatefulWidget {
  const MyStapper({Key? key}) : super(key: key);

  @override
  State<MyStapper> createState() => _MyStapperState();
}

class _MyStapperState extends State<MyStapper> {
  List<GlobalKey<FormState>> formkey =
      List.generate(3, (index) => GlobalKey<FormState>());

  int stepindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stapper",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stepper(
            currentStep: stepindex,
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        (stepindex < 2)
                            ? (formkey[stepindex].currentState!.validate())
                                ? setState(() => stepindex++)
                                : null
                            : null;
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.lightGreen),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 80,
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          (stepindex > 0) ? setState(() => stepindex--) : null;
                        });
                      },
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.lightGreen),
                      ),
                    ),
                  ),
                ],
              );
            },
            steps: [
              Step(
                  title: const Text("Sign Up"),
                  isActive: stepindex >= 0,
                  state:
                      stepindex <= 0 ? StepState.editing : StepState.complete,
                  content: Form(
                    key: formkey[0],
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "First Name",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Last Name",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                      ],
                    ),
                  )),
              Step(
                  title: const Text("Login"),
                  isActive: stepindex >= 1,
                  state:
                      stepindex <= 1 ? StepState.editing : StepState.complete,
                  content: Form(
                    key: formkey[1],
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "User Name",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Details";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                      ],
                    ),
                  )),
              Step(
                title: const Text("Home"),
                isActive: stepindex >= 2,
                state: stepindex <= 2 ? StepState.editing : StepState.complete,
                content: Form(
                  key: formkey[2],
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Details";
                      } else {
                        null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
