import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/signUp/cparti.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuiVous extends StatefulWidget {
  const QuiVous({super.key});

  @override
  State<QuiVous> createState() => _QuiVousState();
}

class _QuiVousState extends State<QuiVous> {
  final formKey = GlobalKey<FormState>();


  String? gender;

  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                alignment: Alignment.topRight,
                child: Text(
                  "Besion d'aide?",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: mainColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Qui êtes-vous? !',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Vos donnees seront sécurisées. Elles ne seront pas stockées sur le telephone ni transmises aux tiers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
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
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: secondColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (gender == null || gender!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Veuillez sélectionner votre civilité.'),
                          ),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Cparti())));
                      }
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
      
    );
  }
}
