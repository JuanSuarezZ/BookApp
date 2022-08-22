import 'package:bookapp/domain/models/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Book book = arguments['book'];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _createHero(book, size),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).dividerColor,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Oficial Title: '),
                        TextSpan(
                            text: ' ${book.title}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
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
                        const TextSpan(text: 'First Publish Year: '),
                        TextSpan(
                            text: '${book.firstPublishYear}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
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
                        const TextSpan(text: 'Author Name: '),
                        TextSpan(
                            text: " ${book.authorName}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _createHero(Book book, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: '${book.key}',
          child: CachedNetworkImage(
            imageUrl:
                'https://covers.openlibrary.org/b/id/${book.coverI}-L.jpg',
            fit: BoxFit.contain,
            height: size.height * .4,
            filterQuality: FilterQuality.low,
            placeholder: (context, url) => Image.asset(
              'assets/placeholder.jpg',
              fit: BoxFit.contain,
              height: size.height * .2,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
