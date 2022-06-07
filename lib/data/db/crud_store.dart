abstract class CrudStore<T> {
  String get boxId;

  Future<void> create(T value);
  Future<void> delete(String key);
  Future<T> read(String key);
  Future<List<T>> readAll();
}
