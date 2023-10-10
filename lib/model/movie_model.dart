
class Movie {
  final String mmSn;
  final String mmName;
  final String mmRemarks;
  final String mmTitleImg;

  Movie({
    required this.mmSn,
    required this.mmName,
    required this.mmRemarks,
    required this.mmTitleImg,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      mmSn: json['MM_SN'] as String,
      mmName: json['MM_NAME'] as String,
      mmRemarks: json['MM_REMARKS'] as String,
      mmTitleImg: json['MM_TITLEIMG'] as String,
    );
  }
}

List<String> castListToString(List<Movie> listOfMovies) {
  List<String> listOfStrings = [];
  for (Movie movie in listOfMovies) {
    listOfStrings.add(movie.mmName);
  }
  return listOfStrings;
}
