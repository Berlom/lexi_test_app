class CondidateModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? nic;
  bool? hasAccess;
  String? birthDate;
  String? type;
  String? category;
  School? school;
  String? photo;
  Account? account;
  int? codeSold;
  int? timeConsumed;
  int? amountToPaid;
  List<Series>? series;
  int? drivingPrice;
  int? drivingExamPrice;
  int? codePrice;
  int? packageCodePrice;
  int? packageDrivingPrice;
  int? codeExamPrice;
  String? createdAt;
  int? accomplishedCodeAppointment;
  int? accomplishedDrivingAppointment;
  List<Appointments>? appointments;
  List<Amounts>? amounts;
  int? paidAmount;
  int? amountToPay;
  List<Exams>? exams;
  String? fullName;

  CondidateModel(
      {id,
      firstName,
      lastName,
      phone,
      nic,
      hasAccess,
      birthDate,
      type,
      category,
      school,
      photo,
      account,
      codeSold,
      timeConsumed,
      amountToPaid,
      series,
      drivingPrice,
      drivingExamPrice,
      codePrice,
      packageCodePrice,
      packageDrivingPrice,
      codeExamPrice,
      createdAt,
      accomplishedCodeAppointment,
      accomplishedDrivingAppointment,
      appointments,
      amounts,
      paidAmount,
      amountToPay,
      exams,
      fullName});

  CondidateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    nic = json['nic'];
    hasAccess = json['hasAccess'];
    birthDate = json['birthDate'];
    type = json['type'];
    category = json['category'];
    school =
        json['school'] != null ?  School.fromJson(json['school']) : null;
    photo = json['photo'];
    account =
        json['account'] != null ?  Account.fromJson(json['account']) : null;
    codeSold = json['codeSold'];
    timeConsumed = json['timeConsumed'];
    amountToPaid = json['amountToPaid'];
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add( Series.fromJson(v));
      });
    }
    drivingPrice = json['drivingPrice'];
    drivingExamPrice = json['drivingExamPrice'];
    codePrice = json['codePrice'];
    packageCodePrice = json['packageCodePrice'];
    packageDrivingPrice = json['packageDrivingPrice'];
    codeExamPrice = json['codeExamPrice'];
    createdAt = json['createdAt'];
    accomplishedCodeAppointment = json['accomplishedCodeAppointment'];
    accomplishedDrivingAppointment = json['accomplishedDrivingAppointment'];
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add( Appointments.fromJson(v));
      });
    }
    if (json['amounts'] != null) {
      amounts = <Amounts>[];
      json['amounts'].forEach((v) {
        amounts!.add( Amounts.fromJson(v));
      });
    }
    paidAmount = json['paidAmount'];
    amountToPay = json['amountToPay'];
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add( Exams.fromJson(v));
      });
    }
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['nic'] = nic;
    data['hasAccess'] = hasAccess;
    data['birthDate'] = birthDate;
    data['type'] = type;
    data['category'] = category;
    if (school != null) {
      data['school'] = school!.toJson();
    }
    data['photo'] = photo;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['codeSold'] = codeSold;
    data['timeConsumed'] = timeConsumed;
    data['amountToPaid'] = amountToPaid;
    if (series != null) {
      data['series'] = series!.map((v) => v.toJson()).toList();
    }
    data['drivingPrice'] = drivingPrice;
    data['drivingExamPrice'] = drivingExamPrice;
    data['codePrice'] = codePrice;
    data['packageCodePrice'] = packageCodePrice;
    data['packageDrivingPrice'] = packageDrivingPrice;
    data['codeExamPrice'] = codeExamPrice;
    data['createdAt'] = createdAt;
    data['accomplishedCodeAppointment'] = accomplishedCodeAppointment;
    data['accomplishedDrivingAppointment'] =
        accomplishedDrivingAppointment;
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    if (amounts != null) {
      data['amounts'] = amounts!.map((v) => v.toJson()).toList();
    }
    data['paidAmount'] = paidAmount;
    data['amountToPay'] = amountToPay;
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    data['fullName'] = fullName;
    return data;
  }
}

class School {
  String? id;

  School({id});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Account {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? username;

  Account(
      {id, firstName, lastName, fullName, username});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['username'] = username;
    return data;
  }
}

class Series {
  String? id;
  bool? isView;
  Series? series;
  String? createdAt;

  Series({id, isView, series, createdAt});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isView = json['isView'];
    series =
        json['series'] != null ?  Series.fromJson(json['series']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isView'] = isView;
    if (series != null) {
      data['series'] = series!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class Appointments {
  String? startedAt;
  String? startedTime;
  String? endTime;
  int? session;
  String? comment;
  int? status;
  int? type;
  int? candidateAmount;
  String? sender;
  String? receiver;

  Appointments(
      {startedAt,
      startedTime,
      endTime,
      session,
      comment,
      status,
      type,
      candidateAmount,
      sender,
      receiver});

  Appointments.fromJson(Map<String, dynamic> json) {
    startedAt = json['startedAt'];
    startedTime = json['startedTime'];
    endTime = json['endTime'];
    session = json['session'];
    comment = json['comment'];
    status = json['status'];
    type = json['type'];
    candidateAmount = json['candidateAmount'];
    sender = json['sender'];
    receiver = json['receiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startedAt'] = startedAt;
    data['startedTime'] = startedTime;
    data['endTime'] = endTime;
    data['session'] = session;
    data['comment'] = comment;
    data['status'] = status;
    data['type'] = type;
    data['candidateAmount'] = candidateAmount;
    data['sender'] = sender;
    data['receiver'] = receiver;
    return data;
  }
}


class Amounts {
  String? id;
  int? amount;
  bool? isRemise;
  String? amountDate;
  String? comment;
  CreatedBy? createdBy;
  String? createdAt;
  String? updatedAt;

  Amounts(
      {id,
      amount,
      isRemise,
      amountDate,
      comment,
      createdBy,
      createdAt,
      updatedAt});

  Amounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    isRemise = json['isRemise'];
    amountDate = json['amountDate'];
    comment = json['comment'];
    createdBy = json['createdBy'] != null
        ?  CreatedBy.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['isRemise'] = isRemise;
    data['amountDate'] = amountDate;
    data['comment'] = comment;
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? username;

  String? type;

  CreatedBy(
      {id,
      firstName,
      lastName,
      fullName,
      username,
      type});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    username = json['username'];
    id = json['@id'];
    type = json['@type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['username'] = username;
    data['@id'] = id;
    data['@type'] = type;
    return data;
  }
}

class Exams {
  String? id;
  String? monitor;
  String? examDate;
  String? examTime;
  int? type;
  int? status;
  int? candidateAmount;
  String? listNumber;
  String? convocationNumber;

  Exams(
      {id,
      monitor,
      examDate,
      examTime,
      type,
      status,
      candidateAmount,
      listNumber,
      convocationNumber});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    monitor = json['monitor'];
    examDate = json['examDate'];
    examTime = json['examTime'];
    type = json['type'];
    status = json['status'];
    candidateAmount = json['candidateAmount'];
    listNumber = json['listNumber'];
    convocationNumber = json['convocationNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['monitor'] = monitor;
    data['examDate'] = examDate;
    data['examTime'] = examTime;
    data['type'] = type;
    data['status'] = status;
    data['candidateAmount'] = candidateAmount;
    data['listNumber'] = listNumber;
    data['convocationNumber'] = convocationNumber;
    return data;
  }
}
