import 'dart:io';

void main() {
  // *
  // **
  // ***
  // ****
  // *****
  for (int i = 0; i <= 5; i++) {
    print("*" * i);
  }
  print("\n---------Break---------\n");

  // *****
  // ****
  // ***
  // **
  // *
  for (int i = 5; i >= 1; i--) {
    print("*" * i);
  }
  print("\n---------Break---------\n");

  //     *
  //    ***
  //   *****
  //  *******
  // *********
  int n = 5;
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    stdout.writeln(" ");
  }
  print("\n---------Break---------\n");

  // *********
  //  *******
  //   *****
  //    ***
  //     *
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i - 1; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= 2 * (n - i) + 1; k++) {
      stdout.write("*");
    }
    stdout.writeln(" ");
  }
  print("\n---------Break---------\n");

  // 1
  // 12
  // 123
  // 1234
  // 12345
  for (int i = 0; i < 5; i++) {
    var pattern = '';
    for (int j = 1; j <= i + 1; j++) {
      pattern += j.toString();
    }
    print(pattern);
  }
  print("\n---------Break---------\n");

  // 1
  // 2 3
  // 4 5 6
  // 7 8 9 10
  var count = 1;
  for (int i = 1; i <= 4; i++) {
    for (int j = 1; j <= i; j++) {
      // print(count);
      stdout.write("$count ");
      count++;
    }
    stdout.writeln();
  }
  print("\n---------Break---------\n");

  // A
  // AB
  // ABC
  // ABCD
  // ABCDE
  for (int i = 65; i <= 69; i++) {
    for (int j = 65; j <= i; j++) {
      stdout.write(String.fromCharCode(j));
    }
    stdout.writeln('');
  }
  print("\n---------Break---------\n");
  // ABCDE
  // ABCD
  // ABC
  // AB
  // A
  for (int i = 69; i >= 65; i--) {
    for (int j = 65; j <= i; j++) {
      stdout.write(String.fromCharCode(j));
    }
    stdout.writeln('');
  }
  print("\n---------Break---------\n");

  // 1
  // 01
  // 101
  // 0101
  // 10101

  for (int i = 1; i <= 5; i++) {
    for (int j = 2; j <= i + 1; j++) {
      stdout.write((i + j) % 2);
    }
    stdout.writeln('');
  }
  print("\n---------Break---------\n");

  //     1
  //    121
  //   12321
  //  1234321
  // 123454321

  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= i; k++) {
      stdout.write(k);
    }
    for (int x = i - 1; x >= 1; x--) {
      stdout.write(x);
    }
    stdout.writeln(" ");
  }
  print("\n---------Break---------\n");

  //12345
  //109876
  //11121311415

  // for (int i = 1; i <= 1; i++) {
  //   for (int j = 1; j <= 5; j++) {
  //     stdout.write(j);
  //   }
  //   stdout.writeln(" ");
  //   for (int k = 10; k > 5; k--) {
  //     stdout.write(k);
  //   }
  //   stdout.writeln(" ");
  //   for (int x = 11; x <= 15; x++) {
  //     stdout.write(x);
  //   }
  //   stdout.writeln(" ");
  // }

  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 5; j++) {
      stdout.write(j);
      for (int k = j + 5; k > j; k--) {
        stdout.write(k);
        for (int x = k + 5; x <= 15; x++) {
          stdout.write(x);
        }
        stdout.writeln();
      }
    }
  }
  print("\n---------Break---------\n");
}
