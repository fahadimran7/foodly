extension StringHelpers on String {
  String get toCityDocument {
    return split(' ').join('-').toLowerCase();
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
