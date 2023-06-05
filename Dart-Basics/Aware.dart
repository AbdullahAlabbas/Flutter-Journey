// null aware operator
// (?.), (??), (??=)


class Num{
  int num = 10;
}

main(){

var n = Num();
// ignore: unused_local_variable
int? number;
number =n.num;
print(num);
}