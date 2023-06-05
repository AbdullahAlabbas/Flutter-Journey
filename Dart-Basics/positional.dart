 // Leetcode problem: https://leetcode.com/problems/car-pooling/
// Solution Explanation: https://leetcode.com/problems/car-pooling/solutions/3252690/dart-time-o-n-o-1-space-solution/

import 'dart:math';

bool carPooling(List<List<int>> trips, int capacity) {
  List<int> passengerTimelineCount = List.filled(1001, 0);
  int lastPoint = 0;

  for (List<int> trip in trips) {
    int count = trip[0];
    int from = trip[1];
    int to = trip[2];
    if (count > capacity) {
      return false;
    }

    lastPoint = max(lastPoint, to);
    passengerTimelineCount[from] += count;
    passengerTimelineCount[to] -= count;
  }

  for (int i = 1; i < lastPoint; ++i) {
    passengerTimelineCount[i] += passengerTimelineCount[i - 1];
    if (passengerTimelineCount[i] > capacity) {
      return false;
    }
  }
  return true;
}

void main() {
  List<List<int>> trips = [
    [2, 1, 5],
    [3, 3, 7]
  ];

  List<List<int>> trips1 = [
    [2, 1, 5],
    [3, 5, 7]
  ];

  List<List<int>> trips2 = [
    [2, 2, 6],
    [2, 4, 7],
    [8, 6, 7]
  ];

  List<List<int>> trips3 = [
    [7, 5, 6],
    [6, 7, 8],
    [10, 1, 6]
  ];

  test('test case 1', () => expect(carPooling(trips, 4), false));
  test('test case 2', () => expect(carPooling(trips, 5), true));
  test('test case 3', () => expect(carPooling(trips1, 3), true));
  test('test case 4', () => expect(carPooling(trips2, 11), true));
  test('test case 5', () => expect(carPooling(trips3, 16), false));
}

import 'package:test/test.dart';

List<int> moveZeroes(List<int> nums) {
  int lastNonZeroFoundAt = 0;

  for (int i = 0; i < nums.length; ++i) {
    if (nums[i] != 0) {
      nums[lastNonZeroFoundAt] = nums[i];
      lastNonZeroFoundAt += 1;
    }
  }

  for (int i = lastNonZeroFoundAt; i < nums.length; ++i) {
    nums[i] = 0;
  }
  return nums;
}

void main() {
  test('test case 1', () {
    return expect(moveZeroes([1, 0, 2, 0, 0]), [1, 2, 0, 0, 0]);
  });
  test('test case 2', () {
    return expect(moveZeroes([1, 2, 2, 3, 5]), [1, 2, 2, 3, 5]);
  });
  test('test case 3', () {
    return expect(moveZeroes([0, 0, 0, 0, 0]), [0, 0, 0, 0, 0]);
  });
  test('test case 4', () {
    return expect(moveZeroes([]), []);
  });
}

import 'package:test/test.dart';

// Leetcode problem URL: https://leetcode.com/problems/find-pivot-index/
int sum(List<int> numbers) {
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  return sum;
}

int pivotIndex(List<int> nums) {
  int leftSum = 0;
  int arraySum = sum(nums);

  for (int i = 0; i < nums.length; ++i) {
    if (leftSum == arraySum - leftSum - nums[i]) {
      return i;
    }
    leftSum += nums[i];
  }

  return -1;
}

void main() {
  test('test case 1', () => expect(pivotIndex([1, 7, 3, 6, 5, 6]), 3));
  test('test case 2', () => expect(pivotIndex([2, 1, -1]), 0));
  test('test case 3', () => expect(pivotIndex([1, 2, 3]), -1));
}

import 'package:test/test.dart';

List<int> sortedSquaredArray(List<int> array) {
  int start = 0;
  int end = array.length - 1;
  int sortedIndex = array.length - 1;
  List<int> answer = List.filled(array.length, 0);

  while (end >= start) {
    if (array[start].abs() > array[end].abs()) {
      answer[sortedIndex] = array[start] * array[start];
      start += 1;
    } else {
      answer[sortedIndex] = array[end] * array[end];
      end -= 1;
    }
    sortedIndex -= 1;
  }

  return answer;
}

void main() {
  test('test case 1', () {
    expect(sortedSquaredArray([-1, -1, 2, 3, 3, 3, 4]), [1, 1, 4, 9, 9, 9, 16]);
  });

  test('test case 2', () {
    expect(sortedSquaredArray([0]), [0]);
  });

  test('test case 2', () {
    expect(sortedSquaredArray([-7, -6, -5, -4, -3, -2, -1]),
        [1, 4, 9, 16, 25, 36, 49]);
  });

  test('test case 4', () {
    expect(
        sortedSquaredArray([1, 2, 3, 4, 5, 6, 7]), [1, 4, 9, 16, 25, 36, 49]);
  });
}
import 'package:test/test.dart';

bool checkIsSubSequence(List<int> array, List<int> sequence) {
  if (array.isEmpty) {
    return false;
  }

  if (sequence.isEmpty) {
    return true;
  }
  int arrayIndex = 0;
  int sequenceIndex = 0;

  while (sequenceIndex < sequence.length && arrayIndex < array.length) {
    if (sequence[sequenceIndex] == array[arrayIndex]) {
      sequenceIndex += 1;
    }
    arrayIndex += 1;
  }
  return sequenceIndex == sequence.length;
}

void main() {
  List<int> array;
  List<int> sequence;

  test('test 1', () {
    array = [5, 1, 22, 25, 6, -1, 8, 10];
    sequence = [1, 6, -1, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 2', () {
    array = [5, 1, 22, 25, 6, -1, 8, 10];
    sequence = [5, -1, 8, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 3', () {
    array = [1, 1, 1, 1, 1];
    sequence = [0, 0, 0, 0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 4', () {
    array = [1, 6, -1, 10];
    sequence = [1, 6, -1, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 5', () {
    array = [1, 1, 6, 1];
    sequence = [0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 6', () {
    array = [];
    sequence = [0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 7', () {
    array = [1, 1, 6, 1];
    sequence = [];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });
}

import 'dart:math' show Random;

//main function,the program start
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  bubbleSort(list);
  print(list);
}

void bubbleSort(List<int> a) {
  for (var i = 0, length = a.length; i < length - 1; ++i) {
    bool swapped = false;
    for (var j = 0; j < length - 1 - i; ++j) {
      if (a[j] > a[j + 1]) {
        /* swap */
        var temp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) {
      break; /* array has been sorted */
    }
  }
}

void cocktailSort(List lst) //function to sort a list
{
  bool swap_done = true;
  do {
    swap_done = false;
    for (int i = 0; i < lst.length - 2; i++) {
      swap_done = swapItemCocktail(lst, i, swap_done);
    }

    if (swap_done) {
      swap_done = false;
      for (int i = lst.length - 2; i >= 0; i--) {
        swap_done = swapItemCocktail(lst, i, swap_done);
      }
    }
  } while (swap_done);
}

bool swapItemCocktail(List lst, int i, bool swap_done) {
  if (lst[i] > lst[i + 1]) {
    swap(lst, i);
    swap_done = true;
  }
  return swap_done;
}

void swap(List lst, int i) {
  int tmp = lst[i];
  lst[i] = lst[i + 1];
  lst[i + 1] = tmp;
}

void main() //driver function
{
  var lst = [5, 3, 6, 7, 3, 378, 3, 1, -1];
  print(lst);
  cocktailSort(lst);
  print(lst);
}

// function for combsort
void combSort(List list) {
  int gpVal = list.length;
  double shrink = 1.3;
  bool sortedBool = false;

  while (!sortedBool) {
    gpVal = (gpVal / shrink).floor();
    if (gpVal > 1) {
      sortedBool = false;
    } else {
      gpVal = 1;
      sortedBool = true;
    }

    int i = 0;
    while (i + gpVal < list.length) {
      if (list[i] > list[i + gpVal]) {
        swap(list, i, gpVal);
        sortedBool = false;
      }
      i++;
    }
  }
}

// function to swap the values
void swap(List list, int i, int gpVal) {
  int temp = list[i];
  list[i] = list[i + gpVal];
  list[i + gpVal] = temp;
}

void main() {
  //Get the dummy array
  List arr = [1, 451, 562, 2, 99, 78, 5];
  // for printing the array before sorting
  print("Before sorting the array: $arr\n");
  // applying combSort function
  combSort(arr);
  // printing the sortedBool value
  print("After sorting the array: $arr");
}

import 'package:test/test.dart';

List<int> countSort(List<int> arr) {
  // In case the list is empty, return an empty list
  if (arr.length == 0) return [];

  int min = arr[0], max = arr[0], i;
  List<int> outputArr = [], countArr = [];
  for (int i in arr) {
    if (i > max) max = i;
    if (i < min) min = i;
  }

  int range = max - min + 1;

  // INITIALISING countArr with 0's
  for (i = 0; i < range; i++) {
    countArr.add(0);
  }
  for (i = 0; i < arr.length; i++) {
    outputArr.add(0);
  }

  for (i in arr) {
    countArr[i - min] += 1;
  }

  // PREFIX SUM OF countArr
  for (i = 1; i < countArr.length; i++) {
    countArr[i] += countArr[i - 1];
  }

  // PUTING VALUES IN SORTED ARRAY
  for (i in arr) {
    int index = countArr[i - min];
    outputArr[index - 1] = i;
    countArr[i - min] -= 1;
  }

  // COPYING VALUES OF SORTED ARRAY INTO ORIGINAL ARRAY
  for (i = 0; i < outputArr.length; i++) {
    arr[i] = outputArr[i];
  }

  return arr;
}

int main() {
  test("Sorting of empty list returns empty list", () {
    expect(countSort([]), equals([]));
  });
  test("Sorting one element list return same list", () {
    expect(countSort([1]), equals([1]));
  });
  test("Sorting two times doesnt change input", () {
    List<int> lst = [5, 7, 1, 10, 54, -1];
    expect(countSort(lst), equals(countSort(countSort(lst))));
  });
  test("Sorting already sorted list returns same list", () {
    List<int> lst = [1, 2, 3, 4, 10];
    expect(countSort(lst), equals(lst));
  });
  test("count sort", () {
    expect(countSort([34, -2, 122, 24435, 23, 434, 232, 1323]),
        equals([-2, 23, 34, 122, 232, 434, 1323, 24435]));
  });

  print(countSort([-10, -4, 1, 5, 2, -2]));

  return 0;
}
// Sorting of array using gnome sort
//Author:Shawn
//Email:stepfencurryxiao@gmail.com

//Function sort the array using gnome sort
void gnomeSort(List arr, var n) {
  if (arr == null || n == 0) return;
  int first = 1;
  int second = 2;

  while (first < n) {
    if (arr[first - 1] <= arr[first]) {
      first = second;
      second++;
    } else {
      int temp = arr[first - 1];
      arr[first - 1] = arr[first];
      arr[first] = temp;
      first -= 1;
      if (first == 0) {
        first = 1;
        second = 2;
      }
    }
  }
}

void main() {
  //Get the array
  List arr = [10, 34, 6, 323, 7];

  //Get size of the array
  int n = arr.length;

  //print the array
  print(arr);

  //Sorting of array using gnome sort
  gnomeSort(arr, n);

  //print the result
  print("Sorted:\n" + arr.toString());
}
void sort(List arr) {
  //The length of the list
  int n = arr.length;

  //Build heap (rearrange array)
  for (int i = (n / 2 - 1).round(); i >= 0; i--) {
    heapify(arr, n, i);
  }

  // One by one extract an element from heap
  for (int i = n - 1; i >= 0; i--) {
    //Move current root to end
    var temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    //call max heapify on the reduce heap
    heapify(arr, i, 0);
  }
}

void heapify(List arr, var n, var i) {
  //Init largest as root
  var largest = i;
  //left = 2*i + 1
  var l = 2 * i + 1;
  //right = 2*i + 2
  var r = 2 * i + 2;

  // If left child is lager than root
  if (l < n && arr[l] > arr[largest]) largest = l;

  // If right child is larger than largest so far
  if (r < n && arr[r] > arr[largest]) largest = r;

  // If largest is not root
  if (largest != i) {
    var swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;

    //Recursively heapify the affected sub-tree
    heapify(arr, n, largest);
  }
}

void main() {
  List list = [19, 48, 5, 7, 99, 10];
  sort(list);
  print(list);
}
import 'dart:math' show Random;

void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('----------------------------------------------');
  print('After sorting:');
  insertSort(list);
  print(list);
}

void insertSort(List<int> a) {
  for (var i = 1; i < a.length; i++) {
    int j, t = a[i];
    for (j = i - 1; j >= 0 && t < a[j]; j--) {
      a[j + 1] = a[j];
    }
    if (j < i - 1) a[j + 1] = t;
  }
}
import 'package:test/test.dart';

void merge(List list, int lIndex, int mIndex, int rIndex) {
  int lSize = mIndex - lIndex + 1;
  int rSize = rIndex - mIndex;

  List lList = new List.filled(lSize, () => 0);
  List rList = new List.filled(rSize, () => 0);

  for (int i = 0; i < lSize; i++) lList[i] = list[lIndex + i];
  for (int j = 0; j < rSize; j++) rList[j] = list[mIndex + j + 1];

  int i = 0, j = 0;
  int k = lIndex;

  while (i < lSize && j < rSize) {
    if (lList[i] <= rList[j]) {
      list[k] = lList[i];
      i++;
    } else {
      list[k] = rList[j];
      j++;
    }
    k++;
  }

  while (i < lSize) {
    list[k] = lList[i];
    i++;
    k++;
  }

  while (j < rSize) {
    list[k] = rList[j];
    j++;
    k++;
  }
}

List<int> mergeSort(List<int> list, int lIndex, int rIndex) {
  if (lIndex < rIndex) {
    int mIndex = (rIndex + lIndex) ~/ 2; // finds the middle index

    mergeSort(list, lIndex, mIndex); // sorts the first half of the list
    mergeSort(list, mIndex + 1, rIndex); // sorts the second half of the list

    merge(list, lIndex, mIndex, rIndex);
  }
  return list;
}

void main() {
  List<int> list = [5, 4, 3, 2, 1];
  test('test case 1',
      () => expect(mergeSort(list, 0, list.length - 1), [1, 2, 3, 4, 5]));

  List<int> list1 = [];
  test('test case 2', () => expect(mergeSort(list1, 0, list1.length - 1), []));

  List<int> list2 = [1, 1, 1, 1, 1];
  test('test case 3',
      () => expect(mergeSort(list2, 0, list2.length - 1), [1, 1, 1, 1, 1]));

  List<int> list3 = [-1, -11, -1221, -123121, -1111111];
  test(
      'test case 4',
      () => expect(mergeSort(list3, 0, list3.length - 1),
          [-1111111, -123121, -1221, -11, -1]));

  List<int> list4 = [11, 1, 1200, -1, 5];
  test(
      'test case 1',
      () =>
          expect(mergeSort(list4, 0, list4.length - 1), [-1, 1, 5, 11, 1200]));
}
import 'package:test/test.dart';

void pigeonholeSort(List arr) {
  //The length of the list
  int n = arr.length;

  //checking the size
  if (n <= 0) {
    return;
  }

  //Find minimum and maximum values in arr
  int min = arr[0];
  int max = arr[0];

  for (int i = 1; i < n; i++) {
    if (arr[i] < min) min = arr[i];
    if (arr[i] > max) max = arr[i];
  }

  int range = max - min;
  range++;

  List phole = new List(range);
  for (int i = 0; i < range; i++) {
    phole[i] = 0;
  }

  //Populate the pigeonholes.
  for (int i = 0; i < n; i++) {
    phole[arr[i] - min];
    phole[arr[i] - min] = phole[arr[i] - min] + 1;
  }

  //Put the elements back into the array in order
  int index = 0;

  for (int j = 0; j < range; j++) while (phole[j]-- > 0) arr[index++] = j + min;
}

void main() {
  test("Sort empty list returns empty list", () {
    List list = [];
    pigeonholeSort(list);
    expect(list, isEmpty);
  });

  test("Already sorted list remain sorted", () {
    List list = [1, 2, 3, 4, 5];
    pigeonholeSort(list);
    expect(list, equals([1, 2, 3, 4, 5]));
  });

  test("Sort", () {
    List list = [87, 48, 5, 7, 135, 85];
    pigeonholeSort(list);
    expect(list, equals([5, 7, 48, 85, 87, 135]));
  });

  test("Sorted list size doesnt change", () {
    List list = [1, 1, 4, 1, -12, -12, 77];
    pigeonholeSort(list);
    expect(list.length, equals(7));
    expect(list, [-12, -12, 1, 1, 1, 4, 77]);
  });
}
import 'dart:math' show Random;

// quickSort
// O(n*log n)
void main() {
  var list = List<int>();
  Random random = new Random();
  for (var i = 0; i < 100; i++) {
    list.add(random.nextInt(100));
  }
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  print(quickSort(list));
}

List<int> quickSort(List<int> a) {
  if (a.length < 2) {
    return a;
  } else {
    var pivot = a[0];
    var less = <int>[];
    var greater = <int>[];
    a.removeAt(0);
    for (var i in a) {
      if (i <= pivot) {
        less.add(i);
      } else {
        greater.add(i);
      }
    }
    return quickSort(less) + [pivot] + quickSort(greater);
  }
}

//radix sort
/*
 radix sort is a non-comparative sorting algorithm. It avoids comparison by creating and distributing elements into buckets according to their radix.
  For elements with more than one significant digit, this bucketing process is repeated for each digit, 
 while preserving the ordering of the prior step, until all digits have been considered. For this reason, 
 radix sort has also been called bucket sort and digital sort.
 */
import 'dart:math' as Math;
import 'dart:math' show Random;
import 'package:test/test.dart';

main() {
  test("Sorting of empty list returns empty list", () {
    expect(radixSort([]), equals([]));
  });
  test("Sorting one element list return same list", () {
    expect(radixSort([1]), equals([1]));
  });
  test("Sorting two times doesnt change input", () {
    List<int> lst = [5, 7, 1, 10, 54, -1];
    expect(radixSort(lst), equals(radixSort(radixSort(lst))));
  });
  test("Sorting already sorted list returns same list", () {
    List<int> lst = [1, 2, 3, 4, 10];
    expect(radixSort(lst), equals(lst));
  });
  test("radix sort", () {
    expect(radixSort([34, -2, 122, 24435, 23, 434, 232, 1323]),
        equals([-2, 23, 34, 122, 232, 434, 1323, 24435]));
  });

  final seed = 10, rnd = Random(), length = 10;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('----------------------------------------------');
  print('After sorting:');
  print(radixSort(list));
}

getDigitNum(int n, int i) {
  var cal = (n.round().abs() / Math.pow(10, i)) % 10;

  return cal.round();
}

digitCount(int number) {
  if (number == 0) {
    return 1;
  }
  return (number.abs().toString().length);
}

mostDigits(List number) {
  var maxDigits = 0;
  for (var i = 0; i < number.length; i++) {
    maxDigits = Math.max(maxDigits, digitCount(number[i]));
  }
  return maxDigits;
}

radixSort(List nums) {
  var maxDightCount = mostDigits(nums);
  for (var k = 0; k < maxDightCount; k++) {
    var digitBuckets = List.generate(10, (_) => []);
    for (var i = 0; i < nums.length; i++) {
      var digit = getDigitNum(nums[i], k);
      digitBuckets[digit].add(nums[i]);
    }

    nums = digitBuckets.expand((lst) => lst).toList();
  }
  return nums;
}
import 'dart:math' show Random;

//main function,the program start
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  selectSort(list);
  print(list);
}

void selectSort(List<int> a) {
  for (var i = 0; i < a.length - 1; i++) {
    var mi = i;
    for (var j = i + 1; j < a.length; j++) {
      if (a[j] < a[mi]) mi = j;
    }
    if (i != mi) {
      var t = a[i];
      a[i] = a[mi];
      a[mi] = t;
    }
  }
}
import 'dart:math' show Random;

void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('----------------------------------------------');
  print('After sorting:');
  shellSort(list);
  print(list);
}

void shellSort<E extends Comparable>(List<E> a) {
  for (var i = _initInterval(a); i > 0; i = (i - 1) ~/ 3) {
    for (var g = 0; g < i; g++) {
      for (var j = i + g; j < a.length; j += i) {
        var k = j - i, t = a[j];
        while (k >= 0 && t.compareTo(a[k]) < 0) {
          a[k + i] = a[k];
          k -= i;
        }
        if (k < j - i) a[k + i] = t;
      }
    }
  }
}

int _initInterval<E>(List<E> a) {
  var interval = 1;
  while (interval < a.length ~/ 3) interval = interval * 3 + 1;
  return interval;
}
import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

const int RUN = 32;
void insertionSort(List list, int left, int right) {
  for (int i = left + 1; i <= right; i++) {
    int temp = list[i];
    int j = i - 1;
    while (j >= left && list[j] > temp) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = temp;
  }
}

void merge(List list, int left, int middle, int right) {
  int length1 = middle - left + 1, length2 = right - middle;
  List leftList = List.filled(length1, null),
      rightList = new List.filled(length2, null);

  for (int i = 0; i < length1; i++) {
    leftList[i] = list[left + i];
  }

  for (int i = 0; i < length2; i++) {
    rightList[i] = list[middle + 1 + i];
  }

  int i = 0, j = 0, k = 0;
  while (i < length1 && j < length2) {
    if (leftList[i] <= rightList[j]) {
      list[k] = leftList[i];
      i++;
    } else {
      list[k] = rightList[j];
      j++;
    }
    k++;
  }

  while (i < length1) {
    list[k] = leftList[i];
    i++;
    k++;
  }

  while (j < length2) {
    list[k] = rightList[j];
    k++;
    j++;
  }
}

void timSort(List list, int n) {
  for (int i = 0; i < n; i += RUN) {
    insertionSort(list, i, min((i + 31), n - 1));
  }

  for (int size = RUN; size < n; size = 2 * size) {
    for (int left = 0; left < n; left += 2 * size) {
      int middle = left + size - 1;
      int right = min((left + 2 * size - 1), (n - 1));
      merge(list, left, middle, right);
    }
  }
}

void main() {
  test('test case 1', () {
    List arr = [12, 213, 45, 9, 107];
    timSort(arr, arr.length);
    expect(arr, [9, 12, 45, 107, 213]);
  });

  test('test case 2', () {
    List arr = [];
    timSort(arr, arr.length);
    expect(arr, []);
  });

  test('test case 3', () {
    List arr = [-1, 0, 1];
    timSort(arr, arr.length);
    expect(arr, [-1, 0, 1]);
  });
}