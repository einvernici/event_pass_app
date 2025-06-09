import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart'; 
import 'package:flutter_application_1/widgets/button.dart'; 
import 'package:flutter_application_1/widgets/text_field.dart'; 

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLogin = true; 
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _authenticate() {
    Navigator.pushReplacement( 
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_note, 
                  size: 100,
                  color: Colors.blue[700],
                ),
                const SizedBox(height: 30),
                Text(
                  _isLogin ? 'Bem-vindo de volta!' : 'Crie sua conta!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                if (!_isLogin) 
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Nome Completo',
                  ),
                if (!_isLogin) const SizedBox(height: 15),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Senha',
                ),
                const SizedBox(height: 25),
                CustomButton(
                  text: _isLogin ? 'Entrar' : 'Cadastrar',
                  onTap: _authenticate, 
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _toggleAuthMode, 
                  child: Text(
                    _isLogin
                        ? 'Ainda não tem conta? Cadastre-se'
                        : 'Já tem conta? Faça login',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}