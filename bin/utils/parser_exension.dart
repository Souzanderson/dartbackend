extension ParseExtension on String {
  toType(Type type) {
    switch (type) {
      case String:
        return toString();
      case int:
        return int.parse(toString());
      case dynamic:
        return toString() as dynamic;
      default:
        return toString();
    }
  }
}
