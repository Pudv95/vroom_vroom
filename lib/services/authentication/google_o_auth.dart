import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


class GoogleAuth{
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "246425352710-3baoaucunt65jrkhrs39fimr17iemkup.apps.googleusercontent.com");

  Future<void> handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final String accessToken = googleSignInAuthentication.accessToken!;
      print("---------------------------------------------");
      print(accessToken);
      print("---------------------------------------------");

    } catch (error) {
      print("-----------------++++++++++++++++----------------------------");
      print(error);
      print("-----------------+++++++++++++++++++++----------------------------");
    }
  }

  // Future<void> exchangeTokenWithBackend(String accessToken) async {
  //   final response = await http.post(
  //     Uri.parse(_backendUrl),
  //     body: {'access_token': accessToken},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('Token exchange successful: ${response.body}');
  //   } else {
  //     // Handle error
  //     print('Token exchange failed: ${response.statusCode}');
  //   }
  // }
}