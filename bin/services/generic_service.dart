abstract class GenericService<T> {
  T findone(int id);
  List<T> findAll();
  bool save(T value);
  bool delete(int id);
}
