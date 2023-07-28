class FoodModel {
  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.status,
  });

  final String id;
  final String name;
  final String description;
  final String price;
  final String image;
  final String? status;

// 50 items image from network
  static List<FoodModel> foodList = [
    FoodModel(
      id: '1',
      name: 'Lovy Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '10',
      // random image from internet
      image: 'https://picsum.photos/250?image=9',
      status: 'Best',
    ),
    FoodModel(
      id: '2',
      name: 'Cloudy Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '14',
      // random image from internet
      image: 'https://picsum.photos/250?image=10',
      status: 'Sale',
    ),
    FoodModel(
      id: '3',
      name: 'Circlo Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '11',
      // random image from internet
      image: 'https://picsum.photos/250?image=11',
      status: 'New',
    ),
    FoodModel(
      id: '4',
      name: 'Haty Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '26',
      // random image from internet
      image: 'https://picsum.photos/250?image=12',
      status: 'New',
    ),
    FoodModel(
      id: '5',
      name: 'Hearthy Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '14',
      // random image from internet
      image: 'https://picsum.photos/250?image=13',
      status: 'New',
    ),
    FoodModel(
      id: '6',
      name: 'Recto Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '16',
      // random image from internet
      image: 'https://picsum.photos/250?image=14',
      status: 'New',
    ),
    FoodModel(
      id: '7',
      name: 'Lovy Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '10',
      // random image from internet
      image: 'https://picsum.photos/250?image=15',
      status: 'New',
    ),
    FoodModel(
      id: '8',
      name: 'Cloudy Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '14',
      // random image from internet
      image: 'https://picsum.photos/250?image=16',
      status: 'New',
    ),
    FoodModel(
      id: '9',
      name: 'Circlo Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '11',
      // random image from internet
      image: 'https://picsum.photos/250?image=17',
      status: 'New',
    ),
    FoodModel(
      id: '10',
      name: 'Haty Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '26',
      // random image from internet
      image: 'https://picsum.photos/250?image=18',
      status: 'Best',
    ),
    FoodModel(
      id: '11',
      name: 'Hearthy Resto',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '14',
      // random image from internet
      image: 'https://picsum.photos/250?image=19',
      status: 'Sale',
    ),
    FoodModel(
      id: '12',
      name: 'Recto Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '16',
      // random image from internet
      image: 'https://picsum.photos/250?image=20',
      status: 'Best',
    ),
    FoodModel(
      id: '13',
      name: 'Lovy Food',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
      price: '10',
      // random image from internet
      image: 'https://picsum.photos/250?image=21',
      status: 'New',
    ),
  ];
}
