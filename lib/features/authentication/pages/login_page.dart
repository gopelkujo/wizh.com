import 'package:flutter/material.dart';
import 'package:wizhdotcom/shared/components/my_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildTitle(), _buildForm()],
              ),
              _buildRegisterText(),
            ],
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
          children: [
            TextSpan(text: 'Belum memiliki akun? '),
            WidgetSpan(child: _buildRegisterButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        TextFormField(),
        TextFormField(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text('Wizh');
  }
}
