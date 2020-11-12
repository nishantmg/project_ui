class Restaurant{
    final int restaurantId;
    final String restaurantName;
    final String restaurantImage;
    final bool status ;
    final String createdAt;
    final String deletedAt;

  Restaurant({this.restaurantId, this.restaurantName, this.restaurantImage, this.status, this.createdAt, this.deletedAt});


  Restaurant.fromMap(Map<String, dynamic> data):
      restaurantId = data['restaurantId'],
      restaurantName = data['restaurantName'],
      restaurantImage = data['restaurantImage'],
      status = data['status'],
      createdAt = data['createdAt'],
      deletedAt = data['deletedAt'];
    static List<Restaurant> fromData(List<Map<String,dynamic>> data){
      return data.map((restaurant) => Restaurant.fromMap(restaurant)).toList();
    }
}