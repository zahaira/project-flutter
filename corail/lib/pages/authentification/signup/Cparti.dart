import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/signup/Dite_plus.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Cparti extends StatefulWidget {
  const Cparti({super.key});

  @override
  State<Cparti> createState() => _CpartiState();
}

class _CpartiState extends State<Cparti> {
  final formKey = GlobalKey<FormState>();

  String? gender;

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
                  Icons.add_reaction,
                  size: 70,
                  color: mainColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'C\'est part!',
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
                  'Inscrivez-vous, ça ne vous prendra qu\'un instant, promis !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Numéro de téléphone est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Téléphone *',
                    prefixIcon: CountryCodePicker(
                      onChanged: print,
                      showFlagMain: false,
                      textStyle: TextStyle(color: Colors.grey),
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: '+212',
                      favorite: ['+212'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 265,
                      height: 90,
                      child: Image.asset(
                        'assets/phonehint.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        top: 32,
                        left: 11,
                        child: SizedBox(
                          width: 245,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Ce numero permettra de vous identifier. Un SMS vous sera envoye en fin d\'inscription pour le valider',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Adresse email est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    // hintText: 'What do people call you?',
                    labelText: 'Adresse email *',
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
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: secondColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Dite_plus())));
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
