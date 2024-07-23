// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';

class ProfileLable extends StatelessWidget {
  const ProfileLable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber[100],
        ),
        child: Center(
            child: Text(
          userDataFetcher['Name'] == null
              ? 'U'
              : userDataFetcher['Name'].substring(0, 1),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )));
  }
}

// Future<void> _getdata(Function(List) onDataFetched) async {
//   final user = supabase.auth.currentUser;
//   PostgrestMap response;
//   if (user != null) {
//     try {
//       response = (await supabase
//           .from('user_profiles')
//           .select()
//           .eq('id', user.id)
//           .single());
//       // setState(() {
//       //   userDataFetcher = response;
//       //   userID = user.email!;
//       //   userid = user.id;
//       // });
//       onDataFetched(response as List);
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
