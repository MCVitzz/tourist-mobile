class PointOfInterest {
  int id;
  String name;
  int scans;
  double ratings;
  int ratingCount;
  List<String> images;

  PointOfInterest(this.id, this.name, this.scans, this.ratings,
      this.ratingCount, this.images);

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    var lst = List<String>.from(json['images']);
    return PointOfInterest(
      json['id'],
      json['name'],
      json['scans'],
      json['rating'],
      json['ratingCount'],
      lst,
    );
  }

  static PointOfInterest carnaxide =
      PointOfInterest(1, 'Carnaxide', 4000, 4.7, 2900, [
    'assets/images/carnaxide/carnaxide1.jpg',
    'assets/images/carnaxide/carnaxide2.jpg',
    'assets/images/carnaxide/carnaxide3.jpg'
  ]);
  static PointOfInterest terreiro =
      PointOfInterest(2, 'Terreiro do Paço', 2520, 4.9, 9900, [
    'assets/images/terreiro/terreiro1.jpg',
    'assets/images/terreiro/terreiro2.jpg',
    'assets/images/terreiro/terreiro3.jpg'
  ]);
  static PointOfInterest sjorge =
      PointOfInterest(3, 'Castelo de São Jorge', 2872, 3.5, 9282, [
    'assets/images/sjorge/sjorge1.jpg',
    'assets/images/sjorge/sjorge2.jpg',
    'assets/images/sjorge/sjorge3.jpg'
  ]);
}
