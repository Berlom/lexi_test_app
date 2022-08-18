import 'package:intl/intl.dart';
import '/repository/condidate_repository.dart';

import '../models/condidate_model.dart';

class CondidateViewModel {
  CondidateModel? condidate;
  //Appointments? appointments;
  // List<Appointments?> appointments = [];
  //List<String> appointmentsType = [];

  //String newDateTimeObj2 = toDate(CondidateViewModel().getCreatedAt());

  Future<CondidateModel> getCondidate() async {
    CondidateModel condidate = await CondidateRepository().findAll();
    return condidate;
  }

  String getTotalPrice(int? paidAmmount, int? ammountToPay) {
    String totalPrice = (paidAmmount! + ammountToPay!.abs()).toString();
    // debugPrint(paidAmmount.toString());
    // debugPrint(ammountToPay.toString());

    return totalPrice;
  }

  String appointments(
      List<Appointments>? appointments, int type, String statut) {
    //debugPrint(appointments.toString());
    DateTime now = DateTime.now();
    int realise = 0;
    int planifie = 0;

    appointments?.map((e) {
      String date = e.startedAt!;
      DateTime dateTimeObj = DateFormat("yyyy-MM-dd").parse(date);
      // debugPrint(e.type.toString());
      // debugPrint(dateTimeObj.toString());
      //debugPrint(date);

      if (e.type == type) {
        if (now.difference(dateTimeObj).isNegative) {
          planifie += e.session!;
        } else {
          realise += e.session!;
        }
      }
    }).toList();
    switch (statut) {
      case "realise":
        return realise.toString();

      case "planifie":
        return planifie.toString();
      default:
        0;
    }
    return "0";
  }

  // String examsType(List<Exams>? exams) {
  //   List<String> response = [];
  //   for (var serie in exams!) {
  //     if (serie.type == 1) {
  //       response.add("Code");
  //     }
  //   }
  //   return response.toString();
  // }

  List<Exams> examsElements(List<Exams>? exams) {
    List<Exams>? items = [];

    exams?.map((e) {
      e.monitor ??= "-";

      // if (e.type == 1) {
      //   String typpe = e.type.toString();
      //   e.type = code as List<Exams>;
      //   debugPrint(typpe);
      // }

      items.add(e);
    }).toList();

    return items;
  }

  List<Appointments> historiqueElements(
      List<Appointments>? appointments, int type) {
    List<Appointments>? items = [];

    appointments?.map((e) {
      if (e.type == type) {
        e.sender ??= "-";
        items.add(e);
      }
    }).toList();

    return items;
  }

  String exams(List<Exams>? exams, int typee) {
    int type = 0;
    int session = 1;
    // debugPrint(exams![0].type.toString());

    exams?.map((e) {
      // debugPrint(e.type.toString());
      // debugPrint(dateTimeObj.toString());

      if (e.type == typee) {
        type += session;
      }
    }).toList();
    String stringType = type.toString();

    return stringType;
  }

  String totalExams(List<Exams>? exams) {
    int total = 0;
    int session = 1;

    exams?.map((e) {
      total += session;
    }).toList();

    return total.toString();
  }

  String intToTimeLeft(int? value) {
    int h, m;
    String H = "H:";

    h = value! ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    //s = value - (h * 3600) - (m * 60);
    String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    //String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$hourLeft$H$minuteLeft";

    return result;
  }

  // Future<void> getAppointments() async {
  //   appointments = await CondidateAppointmentsRepository().findAll();
  //   //appointmentsType = getAppointmentsType(condidateAppointments!);
  // }

  // List<String> getAppointmentsType(List<Appointments?> condidateAppointments) {
  //   List<String> reponse = [];
  //   for (var element in condidateAppointments) {
  //     reponse.add(element!.type.toString());
  //   }
  //   return reponse;
  // }

  // Future<void> getAppointmentsByType() async {
  //   List<List> appointments=[];
  //    appointments= await CondidateRepository().findAll();
  // }

  //  static Map<DateTime, String>() {
  //   return  newDateTimeObj2;
  // }

  // DateTime getCreatedAt() {
  //   String createdAt = condidate!.createdAt.toString();
  //   DateTime newDateTimeObj = DateFormat("dd/MM/yyyy").parse(createdAt);
  //   // debugPrint(createdAt);

  //   return newDateTimeObj;
  // }

  // String toDate() {
  //   String createdAt = condidate!.createdAt.toString();
  //   final splitted = createdAt.split("T");

  //   // DateTime newDateTimeObj = DateFormat.yMd().parse(createdAt);
  //   // final date = DateFormat("dd/MM/yyyy").format(newDateTimeObj);
  //   return splitted;
  // }
}



// class CondidateViewModel {
//   CondidateModel? condidate;

//   String newDateTimeObj2 = toDate(CondidateViewModel().getCreatedAt());

//   Future<CondidateModel> getCondidate() async {
//     return await CondidateRepository().findAll();
//   }

//   //  static Map<DateTime, String>() {
//   //   return  newDateTimeObj2;
//   // }

//   DateTime getCreatedAt() {
//     String createdAt = condidate!.createdAt.toString();
//     DateTime newDateTimeObj = DateFormat("dd/MM/yyyy").parse(createdAt);
//     // debugPrint(createdAt);

//     return newDateTimeObj;
//   }

//   static String toDate(DateTime dateTime) {
//     final date = DateFormat.yMMMEd().format(dateTime);
//     return date;
//   }
// }
