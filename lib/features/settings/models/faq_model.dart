import '../../../generated/l10n.dart';

class FaqModel {
  final String question;
  final String answer;

  FaqModel({
    required this.question,
    required this.answer,
  });
}

List<FaqModel> faqList() {
  final s = S.current;
  return [
    FaqModel(
      question: s.faqQuestion1,
      answer: s.faqAnswer1,
    ),
    FaqModel(
      question: s.faqQuestion2,
      answer: s.faqAnswer2,
    ),
    FaqModel(
      question: s.faqQuestion3,
      answer: s.faqAnswer3,
    ),
    FaqModel(
      question: s.faqQuestion4,
      answer: s.faqAnswer4,
    ),
    FaqModel(
      question: s.faqQuestion5,
      answer: s.faqAnswer5,
    ),
    FaqModel(
      question: s.faqQuestion6,
      answer: s.faqAnswer6,
    ),
  ];
}