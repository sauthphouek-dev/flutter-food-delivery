import 'package:delivery_app/gen/assets.gen.dart';

class PopularRestaurantModel {
  PopularRestaurantModel({
    required this.status,
    required this.title,
    required this.image,
  });

  final String status;
  final String title;
  final AssetGenImage image;

  // 10 items
  static List<PopularRestaurantModel> list = [
    PopularRestaurantModel(
      status: '10 mins',
      title: 'Lovy Food',
      image: Assets.images.lovyFood,
    ),
    PopularRestaurantModel(
      status: '14 mins',
      title: 'Cloudy Resto',
      image: Assets.images.cloudyFood,
    ),
    PopularRestaurantModel(
      status: '11 mins',
      title: 'Circlo Resto',
      image: Assets.images.circlo,
    ),
    PopularRestaurantModel(
      status: '26 mins',
      title: 'Haty Food',
      image: Assets.images.haty,
    ),
    PopularRestaurantModel(
      status: '14 mins',
      title: 'Hearthy Resto',
      image: Assets.images.healthy,
    ),
    PopularRestaurantModel(
      status: '16 mins',
      title: 'Recto Food',
      image: Assets.images.recto,
    ),
  ];
}
