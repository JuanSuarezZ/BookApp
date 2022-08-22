import 'package:bookapp/domain/models/user.dart';
import 'package:bookapp/domain/use_cases/user/user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewUserPage extends StatelessWidget {
  const ViewUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserUseCase>(context);
    final User user = provider.getUser();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Center(
                child: user.gender == 'male'
                    ? Icon(
                        Icons.boy,
                        size: 50,
                        color: Colors.blue,
                      )
                    : user.gender == "female"
                        ? Icon(
                            Icons.girl,
                            size: 50,
                            color: Colors.pink,
                          )
                        : Icon(
                            Icons.emoji_people_outlined,
                            size: 50,
                            color: Colors.amber,
                          ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Name: '),
                      TextSpan(
                          text: ' ${user.name}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Last name: '),
                      TextSpan(
                          text: ' ${user.lastname}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Age: '),
                      TextSpan(
                          text: ' ${user.age}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Phone: '),
                      TextSpan(
                          text: ' ${user.phone}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Email: '),
                      TextSpan(
                          text: ' ${user.email}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).dividerColor,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'Date of Birth: '),
                      TextSpan(
                          text: ' ${user.dateofBirth}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                provider.deleteUser();
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
