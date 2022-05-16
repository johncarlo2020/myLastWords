
class Gallery {
   
   final int? id;
   final int? userId;
   final String? imageUrl; 
 
  Gallery({
    this.id,
    this.userId,
    this.imageUrl,       
  });

  //function to convrt json data to gallery model
  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['gallery']['id'],
      userId: json['gallery']['userId'],
      imageUrl: json['gallery']['title'],  
    );
  }
}
