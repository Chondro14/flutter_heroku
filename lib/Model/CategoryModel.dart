class CategoryModel{
  int? id;
  String? name;

  CategoryModel({this.name,this.id});

  CategoryModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
  }
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name
    };
  }
}