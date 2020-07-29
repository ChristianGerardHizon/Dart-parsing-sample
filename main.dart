import 'dart:convert';

class Response {
  final Data data;

  Response({this.data});

  factory Response.fromJson(Map json) {
    return Response(
      data: Data.fromJson(json['data']),
    );
  }

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  final List<Record> records;

  Data({this.records});

  factory Data.fromJson(Map json) {
    return Data(
        records: json['records'] != null
            ? List<Record>.from(json['records'].map((e) => Record.fromJson(e)))
            : null);
  }

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['records'] = this.records != null
        ? this.records.map((e) => e.toJson()).toList()
        : null;
    return data;
  }
}

class Record {
  final String promoId;
  final String title;
  final String from;

  Record({this.promoId, this.title, this.from});

  factory Record.fromJson(Map json) {
    return Record(
      promoId: json['promo_id'],
      title: json['title'],
      from: json['from'],
    );
  }

  toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promo_id'] = this.promoId;
    data['title'] = this.title;
    data['from'] = this.from;

    return data;
  }
}

///
/// Main Execution
///
void main() {
  String response = """ 
 {
    "data": {
        "records": [
            {
                "promo_id":"123123",
                "title": "sample",
                "from": "10-20-2020"
            }
        ]
    }
}
 """;

  /// Parse the object
  Response res = Response.fromJson(jsonDecode(response));

  /// Output the entire object.
  print(res.toJson());

  /// Getting the title of the first record.
  print(res.data.records.first.title);
}
