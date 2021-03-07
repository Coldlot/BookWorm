//проверить на пустой массив при создании
import 'package:bookworm/datamodels/favorite_list.dart';
import 'package:test/test.dart';

void main() {
  test('init empty array', () {
    final favoriteList = FavoriteList();
  

    expect(favoriteList.favorites, []);
    
  });
}