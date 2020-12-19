import 'package:bookworm/datamodels/book.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'books_api.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:5000")
abstract class BooksApi {
  factory BooksApi(Dio dio, {String baseUrl}) = _BooksApi;

  @GET("/getBooks")
  Future<List<BookModel>> getBooks();
}