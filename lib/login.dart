import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formField = GlobalKey<FormState>();
  bool passwordVisible = true;
  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 120,
            width: double.infinity,
            color: const Color(0xFF002147),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ImageIcon(AssetImage('assets/cancel.png'),color: Colors.amber,size: 12,),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/fblogo.jpeg'),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'CONTINUE WITH FACEBOOK',
                            style: TextStyle(
                                fontSize: 14.0,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/googlelogo.png'),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            'CONTINUE WITH GOOGLE',
                            style: TextStyle(
                                fontSize: 14.0,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(thickness: 0.7, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or' , style: TextStyle(fontSize: 12),),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Form(
                      key: formField,
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2.5),
                                ),
                                hintText: 'Enter your email' ,
                                labelText: 'email',
                                labelStyle: TextStyle(
                                  color: Colors.amber[700],
                                  fontSize: 18.0,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || !RegExp (r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                        .hasMatch(value!)) {
                                  return "Enter Correct Email";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber, width: 2.5),
                                ),
                                hintText: 'Enter password',
                                labelText: 'password',
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility , color: Colors.grey[600],),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.amber[700],
                                  fontSize: 14.0,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.{8,})[a-zA-Z0-9]*$')
                                        .hasMatch(value)) {
                                  return "Enter Correct Password";
                                } else {
                                  return null;
                                }
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                activeColor: Colors.blue,
                                onChanged: (newBool) {
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                }),
                            const Text(
                              'Remember me',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14.0),
                            ),
                            const SizedBox(width: 60,),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'forgot password',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 60),
                        backgroundColor: const Color(0xFF002147),
                      ),
                      onPressed: () {
                        if (formField.currentState!.validate()) {
                          setState(() {
                            Navigator.pushNamed(context, '/newspage');
                          });
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Need an account?  ',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 18.0,
                                  )),
                              const TextSpan(
                                text: 'sign Up',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
