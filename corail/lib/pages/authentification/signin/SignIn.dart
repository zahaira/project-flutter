import 'package:corail/common/variable.dart';
import 'package:corail/pages/navigationPages/home.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class FirstSignIn extends StatefulWidget {
  const FirstSignIn({super.key});

  @override
  State<FirstSignIn> createState() => _FirstSignInState();
}

class _FirstSignInState extends State<FirstSignIn>{
  final formKey = GlobalKey<FormState>();

  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Se connecter',
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
                  'Saisissez le numero de telephone avec lequel vous avez creer votre compte.',
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
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mot de passe est obligatoire';
                    }
                    return null;
                  },
                  obscureText: showpass,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                        icon: showpass == true
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    icon: const Icon(Icons.password),
                    labelText: 'Mot de passe *',
                  ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home())));
                    }
                  },
                  child: const Text('SUIVANT'),
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
