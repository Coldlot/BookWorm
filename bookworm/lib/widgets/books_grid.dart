import 'package:bookworm/datamodels/book.dart';
import 'package:flutter/material.dart';

import 'book_thumb.dart';

class BooksGrid extends StatelessWidget {
  final Function(int) onThumbTap;
  final List<BookModel> books;
  final bool isEditingMode;
  final Function(int) onThumbDelete;

  const BooksGrid(
      {@required this.books, this.onThumbTap, this.onThumbDelete, this.isEditingMode = false});

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
            isEditingMode: isEditingMode,
            onDelete: () => onThumbDelete(index),
          );
        },
      ),
    );
  }
}
