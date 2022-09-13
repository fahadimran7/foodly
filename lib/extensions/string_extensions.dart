extension StringHelpers on String {
  String get toCityDocument {
    return split(' ').join('-').toLowerCase();
  }
}
