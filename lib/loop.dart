List<int> winningNumbers = [12, 6, 34, 22, 41,9];

void main() {
 List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  
List<int> ticket2 = [41, 17, 26, 32, 7, 35]; 

  
checkNumbers(ticket1);
  

}




void checkNumbers(List<int> myNumbers){
int count =0;
for(int myNum in myNumbers){
  for(int winningNum in winningNumbers){
    if(winningNum==myNum){
      count++;
    }
  }
}
print(count);
}