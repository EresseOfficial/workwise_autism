import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../widgets/color_constants.dart';
import '../../../../profile_management/signup/status.dart';
import 'signup.dart';

class Company extends StatefulWidget {
  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Création des contrôleurs pour les champs de texte
  TextEditingController companyNameController = TextEditingController();
  TextEditingController headOfficeController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  // Fonction pour enregistrer les données de l'entreprise dans Firestore
  Future<void> saveCompanyData() async {
    CollectionReference companies = FirebaseFirestore.instance.collection('companies');

    await companies.add({
      'company_name': companyNameController.text,
      'head_office': headOfficeController.text,
      'registration_number': registrationNumberController.text,
      'website': websiteController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyDark,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 100),

            // logo app
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/logos/logoApp.png'),
              height: 160,
            ),
            SizedBox(height: 10),

            // company text
            Container(
              child: Column(
                children: [
                  Text(
                    "Renseignez vos informations d'entreprise",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),

            // company name, head office, registration number and website address fields
            Container(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: companyNameController,
                      decoration: InputDecoration(
                          hintText: "Nom de la société",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer le nom de la société";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: headOfficeController,
                      decoration: InputDecoration(
                          hintText: "Siège principal",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer le siège principal";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: registrationNumberController,
                      decoration: InputDecoration(
                          hintText: "N° d'immatriculation",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer le n° d'immatriculation";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: websiteController,
                      decoration: InputDecoration(
                          hintText: "Site web",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer le site web";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // next button
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await saveCompanyData();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CompanySignup()
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Suivant",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}