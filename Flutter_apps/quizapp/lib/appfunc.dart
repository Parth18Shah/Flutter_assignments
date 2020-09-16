import 'QnA.dart';

class AppFunc {
  int _qnum = 0;
  List<QnA> _qbank = [
    QnA("Everything in Flutter is Widget", true),
    QnA("Flutter is based on Java Programming language", false),
    QnA("Widgets in flutter are categorized as Stateful and Stateless", true),
  ];

  bool isOver() {
    if (_qnum >= _qbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _qbank[_qnum].question;
  }

  bool getAnswer() {
    return _qbank[_qnum].answer;
  }

  void nextQuestion() {
    if (_qnum < _qbank.length - 1) {
      _qnum += 1;
    }
  }

  void reset() {
    _qnum = 0;
  }
}
