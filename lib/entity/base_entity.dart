class BaseEntity {
  static int _idCounter = 0;
  int id;

  BaseEntity() : id = _generateId();

  static int _generateId() {
    _idCounter++;
    return _idCounter;
  }
}
