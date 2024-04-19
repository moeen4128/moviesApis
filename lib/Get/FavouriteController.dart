import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  List<String> FavouriteListName = <String>[].obs;
  List<String> FavouriteListImage = <String>[].obs;
  List<String> FavouriteListRating = <String>[].obs;
  RxBool isFavorite = false.obs;
  RxBool isBright = true.obs;

  final String favListNameKey = 'favListName';
  final String favListImageKey = 'favListImage';
  final String favListRatingKey = 'favListRating';

  @override
  void onInit() {
    super.onInit();

    loadDataFromSharedPreferences();
  }

  void toggleTheme() {
    isBright(!isBright.value);
  }

  void addToFavList(String name, image, rating) {
    FavouriteListName.add(name);
    FavouriteListImage.add(image);
    FavouriteListRating.add(rating);
    saveDataToSharedPreferences();
  }

  void RemovefromFav(String name, image, rating) {
    FavouriteListName.remove(name);
    FavouriteListImage.remove(image);
    FavouriteListRating.remove(rating);
    saveDataToSharedPreferences();
  }

  // Save data to SharedPreferences
  void saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(favListNameKey, FavouriteListName);
    prefs.setStringList(favListImageKey, FavouriteListImage);
    prefs.setStringList(favListRatingKey, FavouriteListRating);
  }

  // Load data from SharedPreferences
  void loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FavouriteListName = (prefs.getStringList(favListNameKey) ?? []).obs;
    FavouriteListImage = (prefs.getStringList(favListImageKey) ?? []).obs;
    FavouriteListRating = (prefs.getStringList(favListRatingKey) ?? []).obs;
  }
}
