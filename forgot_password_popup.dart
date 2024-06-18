import 'package:flutter/material.dart';

class ForgotPasswordPopup extends StatefulWidget {
  @override
  _ForgotPasswordPopupState createState() => _ForgotPasswordPopupState();
}

class _ForgotPasswordPopupState extends State<ForgotPasswordPopup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  int _currentStep = 0;

  void _nextStep() {
    setState(() {
      _currentStep++;
    });
  }

  void _prevStep() {
    setState(() {
      _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: _currentStep == 0 ? 471 : _currentStep == 1 ? 345 : 424,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: _currentStep == 0
          ? _buildForgotPasswordForm()
          : _currentStep == 1
          ? _buildOtpForm()
          : _buildResetPasswordForm(),
    );
  }

  Widget _buildForgotPasswordForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Enter your email / Mobile number for the verification process. we will send 4 digit code to your email / Mobile number',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Enter your email id',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _mobileController,
          decoration: InputDecoration(
            labelText: 'Enter your mobile number',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _nextStep,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7775F8), // Set the background color
            foregroundColor: Colors.white,    // Set the text color
          ),
          child: Text('Continue'),
        ),
      ],
    );
  }

  Widget _buildOtpForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Enter 4 Digit Code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Enter the 4 digit code that you have received on your email',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Container(
              width: 50,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  counterText: '', // Removes the counter text
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
              ),
            );
          }),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _nextStep,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7775F8), // Set the background color
            foregroundColor: Colors.white,    // Set the text color
          ),
          child: Text('Continue'),
        ),
      ],
    );
  }

  Widget _buildResetPasswordForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Set the new password for your account so that you can login.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _newPasswordController,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        SizedBox(height: 16),
        TextField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle reset password functionality here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7775F8), // Set the background color
            foregroundColor: Colors.white,    // Set the text color
          ),
          child: Text('Reset Password'),
        ),
      ],
    );
  }
}
