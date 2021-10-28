import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  String selectedValue = "Male";
  bool isButtonActive = false;
  bool _buttonAllowStatus = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    _controllerName.addListener(_ifSignUpValid);
    _controllerEmail.addListener(_ifSignUpValid);
    _controllerPassword.addListener(_ifSignUpValid);
    super.initState();
  }

  void _ifSignUpValid() {
    setState(() {
      if (_controllerName.text.isNotEmpty &&
          _controllerEmail.text.isNotEmpty &&
          _controllerPassword.text.isNotEmpty) {
        _buttonAllowStatus = true;
      } else {
        _buttonAllowStatus = false;
      }
    });
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Sign-up",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.network(
                  'https://live.staticflickr.com/4111/5087455746_5371efe625_z.jpg'),
            ),
            Text(
              'Welcome Aboarrrrrrrrd',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Username can\'nt be empty' : null,
                controller: _controllerName,
                // onSaved: (value) => _name = value,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Email can\'nt be empty' : null,
                controller: _controllerEmail,
                // onSaved: (value) => _email = value,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Password can\'nt be empty' : null,
                controller: _controllerPassword,
                // onSaved: (value) => _password = value,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text('Select Your Gender : '),
            Container(
              width: 200,
              child: DropdownButton(
                  hint: Text('Gender'),
                  value: selectedValue,
                  icon: Visibility(
                      visible: false, child: Icon(Icons.arrow_downward)),
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background
                  onPrimary: Colors.red,
                  onSurface: Colors.black, // foreground
                ),
                onPressed: !_buttonAllowStatus
                    ? null
                    : () {
                        final snackBar = SnackBar(
                          content:
                              const Text('Signed Up Successfully, yarrrrr'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _controllerName.clear();
                        _controllerEmail.clear();
                        _controllerPassword.clear();
                      },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
