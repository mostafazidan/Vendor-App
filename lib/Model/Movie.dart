
class Movie  {
  int id;
  String title;
  String description;
  String image;
  String movieTime;
  List times = [];
  int numberOfSeats = 47;
  // ignore: non_constant_identifier_names
  var seats = [];

  Movie({this.times, this.description, this.movieTime, this.image, this.title, this.seats});

  // ignore: non_constant_identifier_names
  Movie.FormData(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
    image = data['image'];
    movieTime = data['movieTime'];
    times = data['times'];
    numberOfSeats = data['numberOfSeats'];
    seats =data['seats'];
  }
  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['movieTime'] = this.movieTime;
    data['image'] = this.image;
    data['numberOfSeats'] = this.numberOfSeats;
    data['times'] = this.times;
    data['seats']= this.seats;
    return data;
  }
}
