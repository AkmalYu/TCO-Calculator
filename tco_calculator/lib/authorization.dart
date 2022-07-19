import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  AuthorizationPageState createState() => new AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Авторизация")),
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFD7D7D7),
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFC3C7C7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Имя пользователя",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Заполните данное поле";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Color(0xFFD7D7D7),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA60000))),
                            ),
                            onSaved: (value) =>
                                setState(() => username = value!),
                          ),
                          Text(
                            "Пароль",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Заполните данное поле";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Color(0xFFD7D7D7),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA60000))),
                            ),
                            onSaved: (value) =>
                                setState(() => password = value!),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var isValid = formKey.currentState?.validate();
                              if (isValid!) {
                                formKey.currentState?.save();
                              }
                            },
                            child: Text("Вход"),
                          )
                        ],
                      ),
                    )))));
  }
}
