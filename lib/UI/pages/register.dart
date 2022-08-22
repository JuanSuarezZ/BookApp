import 'dart:developer';

import 'package:bookapp/UI/widgets/textFileds/textField.dart';
import 'package:bookapp/domain/use_cases/user/user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //
  DateTime selectedDate = DateTime(1980, 8);
  Future<void> _selectDate(BuildContext context) async {
    final provider = Provider.of<UserUseCase>(context, listen: false);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        provider.getAge(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserUseCase>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  "Sign up",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              CustomTextField(
                bloc: provider.getUserNameBloc(),
                context: context,
                iconLeft: Icons.filter_frames_sharp,
                iconRight: Icons.abc_outlined,
                isPassword: false,
                placeholder: "Name",
                keyboardType: TextInputType.name,
                type: "normal",
              ),
              CustomTextField(
                bloc: provider.getLastnamebloc(),
                context: context,
                iconLeft: Icons.filter_frames_sharp,
                iconRight: Icons.abc_outlined,
                isPassword: false,
                placeholder: "Last Name",
                keyboardType: TextInputType.name,
                type: "normal",
              ),
              CustomTextField(
                bloc: provider.getMailBloc(),
                context: context,
                iconLeft: Icons.email,
                iconRight: Icons.abc_outlined,
                isPassword: false,
                placeholder: "Email",
                keyboardType: TextInputType.name,
                type: "normal",
              ),
              CustomTextField(
                bloc: provider.getPhoneBloc(),
                context: context,
                iconLeft: Icons.phone,
                iconRight: Icons.abc_outlined,
                isPassword: false,
                placeholder: "Phone",
                keyboardType: TextInputType.name,
                type: "normal",
              ),
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date of birth day",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: provider.dateBirth != ""
                            ? Colors.brown
                            : Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        provider.setGender('male');
                      },
                      icon: Icon(
                        Icons.boy,
                        color: provider.gender == 'male' ? Colors.blue : null,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        provider.setGender('female');
                      },
                      icon: Icon(
                        Icons.girl,
                        color: provider.gender == 'female' ? Colors.pink : null,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        provider.setGender('other');
                      },
                      icon: Icon(
                        Icons.emoji_people_outlined,
                        color: provider.gender == 'other' ? Colors.amber : null,
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: provider.getRegistroBloc().formValidStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == true) {
                    return ElevatedButton(
                      onPressed: () {
                        provider.saveProfile();
                      },
                      child: Text("Save Profile"),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 69, 67, 67)),
                      ),
                      child: Text(
                        "Save Profile",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
