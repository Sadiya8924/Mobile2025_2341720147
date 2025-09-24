void main() {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['name'] = 'Diya';
  gifts['nim'] = '2341720147';

  nobleGases[20] = 'Diya';
  nobleGases[21] = '2341720147';

  mhs1['name'] = 'Diya';
  mhs1['nim'] = '2341720147';

  mhs2[99] = 'Diya';
  mhs2[100] = '2341720147';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
