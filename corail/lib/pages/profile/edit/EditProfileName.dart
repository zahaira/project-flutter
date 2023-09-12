import 'package:corail/common/variable.dart';
import 'package:corail/pages/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileName extends StatefulWidget {
  const EditProfileName({super.key});

  @override
  State<EditProfileName> createState() => _EditProfileNameState();
}

class _EditProfileNameState extends State<EditProfileName> {
  String? gender = "male";
  TextEditingController _date = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _date.text = "1998-09-12";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous page.
              Navigator.of(context).pop();
            },
            color: Colors.black, // Set the color to red
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  'Identité',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Icon(
                        Icons.transgender,
                        color: Colors.grey.shade500,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Civilite *',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 17),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text('Madame'),
                        Radio(
                            value: "female",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() {
                                gender = val;
                              });
                            })
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Monsieur'),
                        Radio(
                            value: "male",
                            groupValue: gender,
                            onChanged: (val) {
                              setState(() {
                                gender = val;
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Prénom est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  initialValue: "Hamza",
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    // hintText: 'What do people call you?',
                    labelText: 'Prénom *',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  // validator: (String? value) {
                  //   return (value != null && value.contains('@'))
                  //       ? 'Do not use the @ char.'
                  //       : null;
                  // },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nom obligatoire";
                    } else {
                      return null;
                    }
                  },
                  initialValue: "Riyani",
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nom *',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "La date de naissance est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  controller: _date,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      labelText: "Date de naissance *"),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1800),
                      lastDate: DateTime(2025),
                    );
                    if (pickeddate != null) {
                      setState(() {
                        _date.text =
                            DateFormat('yyyy-MM-dd').format(pickeddate);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                  "Etes vous sur vous voulez sauvgarder les modifications?"),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: mainColor,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Profile()));
                                  },
                                  child: const Text("Sauvgarder"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: mainColor,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Annuler"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text('SUIVANT'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '*Mentions obligatoires.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' CORAIL collecte et traite vos données conformément à la réglementation applicable en matière de protection des données personnelles. Pour en savoir plus, consultez ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' notre charte des données personnelles.',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
