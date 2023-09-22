import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/signUp/Codeactivation.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class Dite_plus extends StatefulWidget {
  const Dite_plus({super.key});

  @override
  State<Dite_plus> createState() => _Dite_plusState();
}

class _Dite_plusState extends State<Dite_plus> {
  final formKey = GlobalKey<FormState>();

  String? selectedCountry = "";
  String? selectedState = "";
  String? selectedCity = "";

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
                  Icons.add_card,
                  size: 70,
                  color: mainColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Dites-nous en plus ? !',
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
                  'Suite aux nouvelles exigences, vous devez saisir votre adresse postale afin de pouvoir utiliser CORAIL',
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
                      return "Adresse est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    // hintText: 'What do people call you?',
                    labelText: 'Adresse *',
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
                      return "Adresse est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    labelText: 'Code postal *',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: CSCPicker(
                  showStates: true,
                  showCities: true,
                  defaultCountry: CscCountry.Morocco,
                  layout: Layout.vertical,
                  countryDropdownLabel: "Pays",
                  stateDropdownLabel: "Région",
                  cityDropdownLabel: "Ville",

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Rechercher un pays",
                  stateSearchPlaceholder: "Rechercher une région",
                  citySearchPlaceholder: "Rechercher une ville",

                  onCountryChanged: (country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                  onStateChanged: (state) {
                    setState(() {
                      selectedState = state;
                    });
                  },
                  onCityChanged: (city) {
                    setState(() {
                      selectedCity = city;
                    });
                  },
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
                          builder: ((context) => const Codeactivation()),
                        ),
                      );
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
