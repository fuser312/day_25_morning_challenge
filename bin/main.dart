import 'dart:math';
// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
//  ]) ➞ true

List sudokuBoard2 = [
  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
];

bool sudokuValidator(List <List<int>>sudokuBoard){
  return isBoardOfRightSize(sudokuBoard) && isValidEntry(sudokuBoard) && checkRow(sudokuBoard) && checkCol(sudokuBoard) &&
      checkBoxesCompatibility(sudokuBoard);
}

  bool isValidEntry(List<List<int>> board) => board.expand((row) => row)
      .every((number) => number > 0 && number <= board.length);

  bool isBoardOfRightSize(List<List<int>> board) =>
    board.every((row) => row.length % 3 == 0) && (board.length % 3 == 0);

  bool checkRow(List<List<int>> board) {
    return !(board.any((List<int> row) => checkDuplication(row)));

  }

  bool checkCol(List<List<int>> board){
    for (int col = 0; col < board.length; col++) {
      List colElementsList = board.map((List row) => row[col]).toList();
      if (checkDuplication(colElementsList)) {
        return false;
      }
    }
    return true;
  }

  bool checkBoxesCompatibility(List<List<int>> board) {
    List finalList = [];
    for (int row = 0; row < 9; row = row + 3) {
      for (int col = 0; col < 9; col = col + 3) {
        for (int finalListRow = row; finalListRow < row + 3; finalListRow++) {
          for (int finalListCol = col; finalListCol < col + 3; finalListCol++) {
            finalList.add(board[finalListRow][finalListCol]);
          }
        }
        return !checkDuplication(finalList);
      }

    }

  }

  bool checkDuplication(List list) => list.toSet().length != list.length;






// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]

List factorSort(List numbers){
  numbers.sort((a, b) => factors(a).compareTo(factors(b)));
  return numbers.reversed.toList();

}


int factors(int num){
  int count = 0;
  //List factorList = [];;
  for (int i = 1; i<= num; i++) {
    if (num % i == 0) {
      count++;
    }
  }
  return count;
}
main() {

  print(sudokuValidator([
 [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
 [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
 [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
 [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
  ]) );

  print(factorSort([9, 7, 13, 12]));
  //print(checkForBoxes([3,4,5], [0,1,2], sudokuBoard2));
}
