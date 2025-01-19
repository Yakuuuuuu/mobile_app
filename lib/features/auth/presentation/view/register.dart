import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamroBooking/features/auth/presentation/view/login.dart';
import '../view_model/register/register_bloc.dart';
import '../view_model/register/register_event.dart';
import '../view_model/register/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Registration successful!"),
                backgroundColor: Colors.blue,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  Login()),
            );
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTitle(),
                        const SizedBox(height: 30),
                        _buildEmailField(),
                        const SizedBox(height: 20),
                        _buildPasswordField(),
                        const SizedBox(height: 20),
                        _buildConfirmPasswordField(),
                        const SizedBox(height: 30),
                        _buildSignUpButton(context, state),
                        const SizedBox(height: 20),
                        _buildLoginRedirect(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 300,
      child: Center(
        child: FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Image.asset(
            'assets/images/tantra-logo.png',
            height: 150,
            color: const Color(0xFF5A79E5), // Color tint for branding
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: const Text(
        "Create Your Account",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF31394F),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1200),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: const Icon(Icons.email),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          } else if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(Icons.lock),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password cannot be empty';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: TextFormField(
        controller: _confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          prefixIcon: const Icon(Icons.lock_outline),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm your password';
          } else if (value != _passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context, RegisterState state) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1800),
      child: ElevatedButton(
        onPressed: state.isLoading
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterBloc>().add(
                        RegisterStudentEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                        ),
                      );
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5A79E5),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRedirect(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 2000),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  Login()),
            );
          },
          child: const Text(
            "Already have an account? Log in",
            style: TextStyle(
              color: Color(0xFF5A79E5),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
