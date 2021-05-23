class MovieModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    final parsedResult = parsedJson['results'];
    print(parsedResult.length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedResult.length; i++) {
      _Result result = _Result(parsedResult[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class _Result {
  int _voteCount;
  int _id;
  bool _video;
  var _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  _Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['posterPath'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    final parsedIds= result['genre_ids'];
    for (int i = 0; i < parsedIds.length; i++) {
      _genreIds.add(parsedIds[i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}