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
            icon: Icon(Icons.arrow_back),
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
                child: Text(
                  'Identité',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Icon(
                        Icons.transgender,
                        color: Colors.grey.shade500,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Civilite *',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 17),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('Madame'),
                          ),
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
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Text('Monsieur'),
                          ),
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
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
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      primary: mainColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  "Etes vous sur vous voulez sauvgarder les modifications?"),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: mainColor,
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  },
                                  child: Text("Sauvgarder"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: mainColor,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Annuler"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Text('SUIVANT'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
