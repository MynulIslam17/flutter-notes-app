
 class NoteModel{

 late String title;
 late  String  body;
 late  String date;
 late bool isSaved;


  NoteModel({
    required this.title,
    required this.body,
    required this.date,
     this.isSaved=false

 });


  NoteModel.fromJson(Map<String,dynamic>json){

    title=json["title"];
    body=json["body"];
    date=json["date"];
    isSaved=json["isSaved"] ?? false;
  }



  Map<String,dynamic>toMap(){

    return{
      "title" : title,
      "body" : body,
      "date"  :  date,
      "isSaved" : isSaved
    };
  }






 }