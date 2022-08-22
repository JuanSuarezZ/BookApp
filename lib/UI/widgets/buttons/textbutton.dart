import 'package:bookapp/domain/use_cases/books/books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextButton extends StatelessWidget {
  final String title;

  const CustomTextButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BooksUseCase>(context);

    return ElevatedButton(
      style: provider.typeSearch != title
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ), //Background Color
              elevation: MaterialStateProperty.all(3), //Defines Elevation
              shadowColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            )
          : ButtonStyle(),
      onPressed: () {
        provider.updatetypeSearch(title);
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
