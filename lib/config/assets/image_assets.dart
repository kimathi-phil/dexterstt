class ImageAssets {
  const ImageAssets._();

  static String get logo => 'logo'.png;
}

extension on String {
  String get png => 'assets/images/$this.png';
}
