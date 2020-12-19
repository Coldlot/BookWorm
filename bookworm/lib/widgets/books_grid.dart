import 'package:bookworm/datamodels/book.dart';
import 'package:flutter/material.dart';

import 'book_thumb.dart';

class BooksGrid extends StatelessWidget {
  final Function(int) onThumbTap;
  final List<BookModel> books;

  const BooksGrid({@required this.books, this.onThumbTap});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 23,
      mainAxisSpacing: 27,
      childAspectRatio: 0.7,
      children: List.generate(
        books.length,
        (index) {
          return BookThumb(
            image: books[index].thumbUrl,
            bookName: books[index].title,
            onTap: () => onThumbTap(index),
          );
        },
      ),
    );
  }
}

// [
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//           onTap: model.showDetails,
//         ),
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//         ),
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//         ),
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//         ),
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//         ),
//         BookThumb(
//           image: "assets/images/test.png",
//           bookName: 'Агент в кринолине - Хорватова Елена - ...',
//         ),
//       ],
