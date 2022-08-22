import 'dart:developer';

import 'package:bookapp/UI/widgets/buttons/textbutton.dart';
import 'package:bookapp/UI/widgets/change_theme_button.dart';
import 'package:bookapp/UI/widgets/searchbox/appbar.dart';
import 'package:bookapp/domain/models/book.dart';
import 'package:bookapp/domain/use_cases/user/user_use_case.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bookapp/domain/use_cases/books/books_use_case.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BooksUseCase>(
          create: (_) => BooksUseCase(),
        ),
      ],
      builder: (context, child) {
        return HomeBody();
      },
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<BooksUseCase>(context, listen: false)
            .searchByAuthor('Tolkien');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    final provider = Provider.of<BooksUseCase>(context);

    ScrollController controller = ScrollController();

    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.position.pixels >
            controller.position.maxScrollExtent - 800) {
          provider.searchNextPage();
        }
      }
    });
    //
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppbarCustom(),
              _typeSearchButtons(),
              _createList(provider, controller),
            ],
          ),
        ),
      ),
    );
  }

  Row _typeSearchButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomTextButton(title: 'By Author'),
        CustomTextButton(title: 'By Title'),
      ],
    );
  }
}

_createList(BooksUseCase provider, ScrollController controller) {
  return provider.isLoading
      ? const CircularProgressIndicator()
      : Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: GridView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: provider.getListBooks().length,
              itemBuilder: (context, i) {
                var book = provider.getListBooks()[i];

                return Item(book: book);
              },
            ),
          ),
        );
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Hero(
      tag: '${book.key}',
      child: Container(
        margin: const EdgeInsets.only(top: 4, right: 2, left: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: GestureDetector(
              onTap: (() => Navigator.pushNamed(
                    context,
                    'Details',
                    arguments: {'book': book},
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg',
                    fit: BoxFit.contain,
                    height: size.height * .2,
                    filterQuality: FilterQuality.low,
                    placeholder: (context, url) => Image.asset(
                      'assets/placeholder.jpg',
                      fit: BoxFit.contain,
                      height: size.height * .2,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            style: Theme.of(context).textTheme.headline3,
                            book.title!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
