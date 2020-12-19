// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BooksApi implements BooksApi {
  _BooksApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://127.0.0.1:5000';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<BookModel>> getBooks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/getBooks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BookModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<BookModel>> filterBooks(predicate) async {
    ArgumentError.checkNotNull(predicate, 'predicate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/filterBooks/$predicate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BookModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
