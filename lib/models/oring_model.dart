
/// Dart 에서 Map 형식으로 작성된 데이터는 직접적으로 DB 에 넣을 수 없습니다.
/// 해당 데이터를 Json 형식으로 바꿔서 넣어야 하는데 Dart는 공식적으로 Json 형식을 지원하지 않습니다.
/// 그래서 이를 위해 Map 형식의 데이터를 Json 으로 바꿔주는 함수를 모델 클래스에 기본적으로 생성하였습니다.
/// 이 부분이 정말정말 귀찮은 부분 입니다.
/// Json 형식으로 받는 모든 데이터를 이런식으로 변경하여 주고 받고 해야 합니다. WTF??
/// 자동으로 변경시켜주는 패키지가 있을 수도 있습니다.

/// 하지만 정말 다행인 점은 별도의 패키지 도움 없이 데이터 모델을 입력하면 json 파싱 함수를 만들어주는 사이트가 있습니다.
/// https://app.quicktype.io/
/// dart 외 여러 언어를 다 지원하니 편하게 사용 합시다.

// 오링 모델 클래스
class Oring {  // Oring
// ignore: slash_for_doc_comments

  int ListNo;
  String STANDARD;
  String No;
  double ID;
  double tolernce_id;
  double CS;
  double tolernce_cs;

  Oring({ // Oring
    this.ListNo,
    this.STANDARD,
    this.No,
    this.ID,
    this.tolernce_id,
    this.CS,
    this.tolernce_cs,
  });

  Map<String, dynamic> toJson() => {
    "ListNo": ListNo,
    "STANDARD": STANDARD,
    "No": No,
    "ID": ID,
    "tolernce_id": tolernce_id,
    "CS": CS,
    "tolernce_cs": tolernce_cs,
  };

  factory Oring.fromJson(Map<String, dynamic> json) => new Oring(
    ListNo: json["ListNo"],
    STANDARD: json["STANDARD"],
    No: json["No"],
    ID: json["ID"],
    tolernce_id: json["tolernce_id"],
    CS: json["CS"],
    tolernce_cs: json["tolernce_cs"],
  );

}