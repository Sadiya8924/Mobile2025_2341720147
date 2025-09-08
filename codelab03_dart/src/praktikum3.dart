void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) break;
    
    if (index > 13 && index < 18) continue;
    print(index);
  }
}