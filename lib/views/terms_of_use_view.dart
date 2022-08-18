// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

import '../components/annuaire_appbar.dart';
import '../components/annuaire_drawer.dart';
import '../components/footer.dart';

class TermOfUseView extends StatelessWidget {
  const TermOfUseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnnuaireAppbar(),
      resizeToAvoidBottomInset: true,
      drawer: AnnuaireDrawer(),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "شروط الاستعمال",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(letterSpacing: 0),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Term(
                            description:
                                ' تتعهد تطبيقة "ليكسي" بحماية المعطيات الشخصية لجميع مستعمليها سواء كانوا أصحاب مؤسسات التكوين أو منظوريهم',
                            iconColor: Color.fromARGB(255, 57, 189, 179)),
                        Term(
                            description:
                                'يجب على جميع رؤساء المؤسسات المنتفعة بهذه التطبيق تفعيل حسابتهم، و في صورة عدم القيام بهذا التفعيل في الآجال لا يحق لهم مواصلة إستعمال التطبيقة إلا بعد استكمال الإجراء ات اللازمة',
                            iconColor: Color.fromARGB(255, 57, 189, 179)),
                        Term(
                            description:
                                'لا يحق لأصحاب مؤسسات التكوين في مجال سياقة العربات والسلامة المرورية المنتفعين من هذه التطبيقة:',
                            iconColor: Color.fromARGB(255, 57, 189, 179)),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Term(description: 'إمتلاك أكثر من حساب واحد'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Term(
                              description:
                                  'تحويل المبالغ المالية المهدات من طرف التطبيقة أو إستعمالها لشراء العروض المتاحة إلا بعد القيام بتفعيل الحساب'),
                        ),
                      ],
                    )),
                Divider(
                  thickness: 2,
                ),
                Footer()
              ],
            ),
          )),
    );
  }
}

class Term extends StatelessWidget {
  String description;
  Color? iconColor;
  Term({Key? key, required this.description, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            size: 18,
            color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
