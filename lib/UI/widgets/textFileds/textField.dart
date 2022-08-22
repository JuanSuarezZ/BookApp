import 'package:bookapp/UI/utils/textfiel_bloc.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData iconRight;
  final IconData iconLeft;
  final String placeholder;
  final TextInputType keyboardType;
  final bool isPassword;
  final String type;
  final BuildContext context;
  final PlantillaTextField bloc;

  const CustomTextField({
    Key? key,
    required this.iconRight,
    required this.iconLeft,
    required this.placeholder,
    required this.keyboardType,
    required this.type,
    required this.context,
    required this.bloc,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    var padding = const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20);
    var margin = const EdgeInsets.only(bottom: 20, left: 16, right: 16);
    var contentPadding =
        const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14);
    final errorStyle =
        TextStyle(fontSize: 12, color: Theme.of(context).errorColor);
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    );
    final icon = IconButton(
        onPressed: () {},
        icon: Icon(iconLeft, color: Theme.of(context).iconTheme.color));
    final decoration = BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 8),
            blurRadius: 4.0)
      ],
    );
    //
    switch (type) {
      case "normal":
        return StreamBuilder(
          stream: bloc.getstream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: padding,
              margin: margin,
              decoration: decoration,
              child: TextField(
                autofocus: false,
                style: Theme.of(context).textTheme.bodyText1,
                controller: bloc.getTextController(),
                obscureText: isPassword,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  fillColor: Colors.white,
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  contentPadding: contentPadding,
                  errorStyle: errorStyle,
                  border: border,
                  icon: icon,
                  hintText: placeholder,
                  errorText: (snapshot.error is ArgumentError ||
                          snapshot.error == null ||
                          bloc.valueofStream() == " " ||
                          snapshot.error is NoSuchMethodError)
                      ? null
                      : snapshot.error.toString(),
                ),
                onChanged: bloc.changeStream(),
              ),
            );
          },
        );
      default:
        return Container();
    }
  }
}
