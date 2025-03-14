class FormDataModel {
  final String message;
  final String assignmentInstructionUrl;
  final String information;
  final JsonResponseModel jsonResponse;

  FormDataModel({
    required this.message,
    required this.assignmentInstructionUrl,
    required this.information,
    required this.jsonResponse,
  });

  factory FormDataModel.fromJson(Map<String, dynamic> json) {
    return FormDataModel(
      message: json['message'],
      assignmentInstructionUrl: json['assignmentInstructionUrl'],
      information: json['information'],
      jsonResponse: JsonResponseModel.fromJson(json['json_response']),
    );
  }
}

class JsonResponseModel {
  final List<AttributeModel> attributes;

  JsonResponseModel({required this.attributes});

  factory JsonResponseModel.fromJson(Map<String, dynamic> json) {
    var attributesJson = json['attributes'] as List;
    List<AttributeModel> attributes = attributesJson.map((i) => AttributeModel.fromJson(i)).toList();
    return JsonResponseModel(attributes: attributes);
  }
}

class AttributeModel {
  final String id;
  final String title;
  final String type;
  final List<String> options;

  AttributeModel({
    required this.id,
    required this.title,
    required this.type,
    required this.options,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    var optionsJson = json['options'] as List;
    List<String> options = optionsJson.map((i) => i.toString()).toList();
    return AttributeModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      options: options,
    );
  }
}