// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print
import 'package:startupculture/main.dart';
import 'package:flutter/material.dart';
import 'package:startupculture/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EnrollmentForm extends StatefulWidget {
  const EnrollmentForm({super.key});

  @override
  _EnrollmentFormState createState() => _EnrollmentFormState();
}

class _EnrollmentFormState extends State<EnrollmentForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? gender;
  String? collegeUniversity;
  String? year;
  String? courseSelection;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _checkSession() async {
    Future<bool> isUserEnrolled() async {
      final user = supabase.auth.currentUser;
      PostgrestMap response;
      if (user != null) {
        try {
          response = await supabase
              .from('user_profiles')
              .select()
              .eq('id', user.id)
              .single();
          if (response.isNotEmpty) {
            return true; // User is enrolled
          } else {
            return false; // User is not enrolled
          }
        } catch (e) {
          print('Error: $e');
          return false;
        }
      }
      return false;
    }

    final isEnrolled = await isUserEnrolled();
    if (isEnrolled) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const homePage()),
      );
    } else {
      _submitForm();
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await supabase.from('user_profiles').insert({
          'Name': fullNameController.text,
          'Email': emailController.text,
          'Phone_number': phoneNumberController.text,
          'Gender': gender,
          'Courses': courseSelection,
          'Years': year,
          'College': collegeUniversity,
        });
        if (response == null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homePage()),
          );
        } else {
          // Data inserted successfully
          print('Received null response from Supabase');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error: Null response from Supabase')),
          );
        }
      } catch (error) {
        // Handle any other errors
        print('Error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
          title: Text(
            'Enrollment Form',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: ['Male', 'Female']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Course Selection',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: [
                    // Engineering Courses
                    'B.Tech. AI & DS',
                    'B.E. CSE',
                    'B.Tech. IT',
                    'B.Tech. ECE',
                    'B.E. EEE',
                    'B.E. ME',
                    'B.Tech. CE',
                    'B.Tech. ChE',
                    'M.Tech. CSE',
                    'M.Tech. AI',
                    'M.Tech. DS',
                    'M.E. CS',
                    'M.E. PED',
                    'M.E. TE',
                    'M.Tech. SE',
                    'M.Tech. ChE',
                    'Ph.D. CSE',
                    'Ph.D. IT',
                    'Ph.D. ECE',
                    'Ph.D. ME',
                    'Ph.D. CE',
                    'Ph.D. ChE',
                    'Diploma CSE',
                    'Diploma EEE',
                    'Diploma ME',
                    'Diploma CE',
                    'Diploma ChE',

                    // Arts Courses
                    'B.A. English Lit.',
                    'B.A. Economics',
                    'B.A. Pol. Sci.',
                    'B.A. History',
                    'B.A. Sociology',
                    'M.A. English Lit.',
                    'M.A. Economics',
                    'M.A. Pol. Sci.',
                    'M.A. History',
                    'M.A. Sociology',
                    'Ph.D. English Lit.',
                    'Ph.D. Economics',
                    'Ph.D. Pol. Sci.',
                    'Ph.D. History',
                    'Ph.D. Sociology',

                    // Business Courses
                    'B.Com. General',
                    'B.Com. Comp. Apps',
                    'B.Com. Acc & Fin',
                    'B.B.A.',
                    'M.Com.',
                    'M.B.A.',
                    'Ph.D. Commerce',
                    'Ph.D. Management',
                  ]
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(
                              label,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      courseSelection = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a course';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: ['1', '2', '3', '4']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      year = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a year';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: 'College/University Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  items: [
                    'KGiSL Institute of Technology',
                    'KCT',
                    'PSG Tech',
                    'Amrita Vishwa Vidyapeetham',
                    'Anna University',
                    'Bharathiar University',
                    'Bharathidasan University',
                    'Madras University',
                    'SRM University',
                    'VIT University',
                    'Others'
                  ]
                      .map(
                        (label) => DropdownMenuItem(
                          value: label,
                          child: Text(
                            label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      collegeUniversity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a college/university';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text('If You Already Enrolled, Click Submit',
                    style: TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _checkSession,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }
}
