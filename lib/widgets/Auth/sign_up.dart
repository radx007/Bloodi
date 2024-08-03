import 'package:bloodi/widgets/Auth/custom_form_drop_down.dart';
import 'package:bloodi/widgets/Auth/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passWordController = TextEditingController();

  final List<String> _algeriaProvinces = [
    "1. Adrar",
    "2. Chlef",
    "3. Laghouat",
    "4. Oum El Bouaghi",
    "5. Batna",
    "6. Béjaïa",
    "7. Biskra",
    "8. Béchar",
    "9. Blida",
    "10. Bouira",
    "11. Tamanrasset",
    "12. Tébessa",
    "13. Tlemcen",
    "14. Tiaret",
    "15. Tizi Ouzou",
    "16. Algiers",
    "17. Djelfa",
    "18. Jijel",
    "19. Sétif",
    "20. Saïda",
    "21. Skikda",
    "22. Sidi Bel Abbès",
    "23. Annaba",
    "24. Guelma",
    "25. Constantine",
    "26. Médéa",
    "27. Mostaganem",
    "28. M'Sila",
    "29. Mascara",
    "30. Ouargla",
    "31. Oran",
    "32. El Bayadh",
    "33. Illizi",
    "34. Bordj Bou Arréridj",
    "35. Boumerdès",
    "36. El Tarf",
    "37. Tindouf",
    "38. Tissemsilt",
    "39. El Oued",
    "40. Khenchela",
    "41. Souk Ahras",
    "42. Tipaza",
    "43. Mila",
    "44. Aïn Defla",
    "45. Naâma",
    "46. Aïn Témouchent",
    "47. Ghardaïa",
    "48. Relizane",
    "49. Timimoun",
    // "50. Bordj Badji Mokhtar",
    "51. Ouled Djellal",
    "52. Béni Abbès",
    "53. In Salah",
    "54. In Guezzam",
    "55. Touggourt",
    "56. Djanet",
    "57. El M'Ghair",
    "58. El Menia"
  ];

  final List<String> _bloodTypes = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];

  final Map<String, String?> _authData = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
    'bloodType': '',
    'State': '',
  };

  bool terms = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              hintText: 'First Name',
              controller: _firstNameController,
            ),
            CustomTextField(
              hintText: 'Last Name',
              controller: _lastNameController,
            ),
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passWordController,
              keyboardType: TextInputType.text,
              isObscureText: true,
              suffixIcon: Icon(
                Icons.password,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * .4 - 20,
                  child: CustomFormDropDown(
                    items: _bloodTypes,
                    suffixIcon: Icon(
                      Icons.bloodtype,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'Blood Type',
                    onChanged: (newValue) {
                      _authData['bloodType'] = newValue;
                    },
                  ),
                ),
                SizedBox(
                  width: width * .55 - 20,
                  child: CustomFormDropDown(
                    items: _algeriaProvinces,
                    suffixIcon: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: 'State',
                    onChanged: (newValue) {
                      _authData['bloodType'] = newValue;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: terms,
                  onChanged: (_) {
                    setState(() {
                      terms = !terms;
                    });
                  },
                ),
                Text(
                  'I agree to the terms & corditions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print('You SIGNED UP');
                print(terms);
              },
              child: const Text(
                'Sign Up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
