class AppConst {
  static const baseUrl = 'https://perenual.com';
  static const endPointSpecies =
      '/api/species-list?key=sk-YbiM6748e75eb2acf7817&page=';
  static speciesDetailsEntPoint(int id) {
    return '/api/species/details/$id?key=sk-YXhc673e41a3b8a1b7704';
  }
}
