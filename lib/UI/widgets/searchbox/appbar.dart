import 'package:bookapp/UI/widgets/change_theme_button.dart';
import 'package:bookapp/domain/use_cases/books/books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppbarCustom extends StatefulWidget {
  const AppbarCustom({Key? key}) : super(key: key);

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BooksUseCase>(context);

    return Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(20)),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              'Books',
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          _TextBox(
            focus: myFocusNode,
            estado: bookProvider.isSearchBoxOpen,
            controller: bookProvider.getTextController(),
          ),
          InkWell(
            onTap: () {
              setState(
                () {
                  FocusScope.of(context).requestFocus(myFocusNode);
                  bookProvider.setStateBoxSearch();
                  bookProvider.searchFromTextField();
                  FocusScope.of(context).unfocus();
                },
              );
            },
            child: const Icon(Icons.search),
          ),
          const ChangeThemeIconButton(),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'userpage');
              },
              child: const Icon(
                Icons.account_circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  final bool? estado;
  final TextEditingController? controller;
  final FocusNode? focus;

  _TextBox(
      {@required this.estado, @required this.controller, @required this.focus});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      width: estado! ? size.width * 0.4 : 0,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        height: 40,
        child: TextField(
          focusNode: focus,
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Search for ...",
          ),
        ),
      ),
    );
  }
}
