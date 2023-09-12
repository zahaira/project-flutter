import 'package:corail/common/variable.dart';
import 'package:corail/pages/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class EditProfilePhone extends StatefulWidget {
  const EditProfilePhone({super.key});

  @override
  State<EditProfilePhone> createState() => _EditProfilePhoneState();
}

class _EditProfilePhoneState extends State<EditProfilePhone> {
  final formKey = GlobalKey<FormState>();
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
                  'Téléphone',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                  initialValue: "0648985541",
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
              SizedBox(
                height: 30,
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
                                    // Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfilePhone()));
                                  },
                                  child: Text("Annuler"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Text('Sauvgarder'),
                ),
              ),
              SizedBox(
                height: 40,
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
