import 'package:bookworm/datamodels/auth.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'books_api.g.dart';

@RestApi(baseUrl: "https://spbstu-books-api.herokuapp.com")
abstract class BooksApi {
  factory BooksApi(Dio dio, {String baseUrl}) = _BooksApi;

  @GET("/getBooks")
  Future<List<BookModel>> getBooks();

  @GET("/filterBooks/{predicate}")
  Future<List<BookModel>> filterBooks(@Path("predicate") String predicate);

  @POST("/registration")
  Future<AuthModel> registration(@Body() Map<String, dynamic> map);

  @POST("/login")
  Future<AuthModel> login(@Body() Map<String, dynamic> map);
}
