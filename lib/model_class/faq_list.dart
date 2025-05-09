class FAQQuestionList {
  String? sId;
  String? quotation;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? answer;

  FAQQuestionList(
      {this.sId,
      this.quotation,
      this.status,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.answer});

  FAQQuestionList.fromJson(Map<String, dynamic> json) {
    sId = (json['_id'] ?? "").toString();
    quotation = (json['quotation'] ?? "").toString();
    status = (json['status'] ?? "").toString();
    user = (json['user'] ?? "").toString();
    createdAt = (json['createdAt'] ?? "").toString();
    updatedAt = (json['updatedAt'] ?? "").toString();
    iV = json['__v'];
    answer = (json['answer'] ?? "Still owner not tell the answer.").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['quotation'] = this.quotation;
    data['status'] = this.status;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['answer'] = this.answer;
    return data;
  }
}
