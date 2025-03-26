import 'package:flutter/material.dart';
import 'package:wizhdotcom/features/trip/pages/trip_page.dart';
import 'package:wizhdotcom/shared/components/my_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _goToTripPage(BuildContext context) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => TripPage()),
        (_) => false,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitle(),
                    const SizedBox(),
                    _buildForm(context),
                  ],
                ),
                _buildRegisterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return MyTextButton(
      onPressed: () {},
      text: 'Daftar Sekarang',
    );
  }

  Align _buildRegisterText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black87),
          children: [
            TextSpan(text: 'Belum memiliki akun? '),
            WidgetSpan(child: _buildRegisterButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'email',
          ),
        ),
        TextFormField(
          onFieldSubmitted: (_) => _goToTripPage(context),
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'password'
          ),
        ),
        ElevatedButton(
          onPressed: () => _goToTripPage(context),
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.hardEdge,
        ),
        Text(
          'Wizh',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
