import 'main.dart';
import 'package:test/test.dart';

void main(){
  test("Test Case 1", (){
    expect(sudokuValidator(sudokuBoard2), true);
  });

  test("Test Case 2", (){
    expect(factorSort([9,7,13,12]), ([12,9,13,7]));
  });
}