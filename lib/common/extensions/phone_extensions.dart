extension StringExtension on String {
  String formatNumber() {
    return '${substring(0, 3)} (${substring(3, 5)}) ${substring(5, 8)} ${substring(8, 10)} ${substring(10)}';
  }
}
