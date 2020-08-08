main() {
  List<int> values = List();
  values.add(12);
  values.add(11);
  values.add(34);
  values.add(37);
  values.add(1);
  values.add(-35);
  var largestnumber = values[0];
  for (var i = 0; i < values.length; i++) {
    if (values[i] > largestnumber) {
      largestnumber = values[i];
    }
  }
  print('The largest value in the list is : $largestnumber');
}
