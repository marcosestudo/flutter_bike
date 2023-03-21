class BikeLocalizationModel {
  // TODO: model
  int? id;
  String? name;

  BikeLocalizationModel({ this.id, this.name });

  BikeLocalizationModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.name = json['name'];
  }

  Map<String, dynamic> toJson() => {'id':id, 'name':name };
}