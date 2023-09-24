class AppConsts
{
  static String? id;
  static const String imageBaseUrl =
      "https://image.tmdb.org/t/p/w500/";
  static const String baseUrl =
      "https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b";
  static String info =
      "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b";
}

// images  // 'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b'
// 'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b'
// images  // 'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b'
// details info  // 'https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b'
