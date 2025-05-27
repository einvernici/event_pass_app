import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/user.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/text_field.dart';

class CreateUserPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameCotroller = TextEditingController();
  
  CreateUserPage({super.key});

  //createUser function

  User createUser()
  {
      return User(email: emailController.toString(), userName: userNameCotroller.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Create User',
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Crie seu Usuário'))),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                //caixa de texto para email
                child: CustomTextField(hintText: 'Email', controller: emailController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //caixa de texto para username
                child: CustomTextField(hintText: 'Username', controller: userNameCotroller),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //botão para criar usuário
                child: CustomButton(text: 'Create User', onTap: () {createUser();}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}