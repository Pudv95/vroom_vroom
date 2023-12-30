import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: (16/height)*height,),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome back to the carpooling \ncommunity',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: (48/height)*height,),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),

                  SizedBox(height: 16),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),

                  SizedBox(height: 8),

                  TextButton(
                    onPressed: () {
                    },
                    child: Text('Forgot Password?',style: Theme.of(context).textTheme.displaySmall,),
                  ),

                  SizedBox(height: 16),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Login',style: Theme.of(context).textTheme.labelLarge,),
                  ),

                  SizedBox(height: 16),

                  OutlinedButton.icon(
                    onPressed: () {
                    },
                    icon: Icon(Icons.flutter_dash),
                    label: Text('Login with Google',style: Theme.of(context).textTheme.labelMedium,),
                  ),

                  SizedBox(height: 16),

                  TextButton(
                    onPressed: () {
                    },
                    child: Text("Don't have an account? Sign up",style: Theme.of(context).textTheme.displaySmall,),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
