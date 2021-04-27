class POI {
  String name;
  double scans;
  double ratings;
  double ratingCount;
  List<String> images;

  POI(this.name, this.scans, this.ratings, this.ratingCount, this.images);

  static POI carnaxide = POI('Carnaxide', 4000, 4.7, 2900, [
    'assets/images/carnaxide/carnaxide1.jpg',
    'assets/images/carnaxide/carnaxide2.jpg',
    'assets/images/carnaxide/carnaxide3.jpg'
  ]);
  static POI terreiro = POI('Terreiro do Paço', 2520, 4.9, 9900, [
    'assets/images/terreiro/terreiro1.jpg',
    'assets/images/terreiro/terreiro2.jpg',
    'assets/images/terreiro/terreiro3.jpg'
  ]);
  static POI sjorge = POI('Castelo de São Jorge', 2872, 3.5, 9282, [
    'assets/images/sjorge/sjorge1.jpg',
    'assets/images/sjorge/sjorge2.jpg',
    'assets/images/sjorge/sjorge3.jpg'
  ]);
}
