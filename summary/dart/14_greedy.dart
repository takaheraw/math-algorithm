class Item {
  int value;
  int weight;

  Item(this.value, this.weight);
}

int compareItems(Item a, Item b) {
  double r1 = a.value / a.weight;
  double r2 = b.value / b.weight;
  return r1.compareTo(r2);
}

double fractionalKnapsack(int capacity, List<Item> items) {
  items.sort((a, b) => compareItems(b, a)); // Sort by decreasing value/weight ratio

  int currentWeight = 0;
  double finalValue = 0.0;

  for (Item item in items) {
    if (currentWeight + item.weight <= capacity) {
      currentWeight += item.weight;
      finalValue += item.value;
    } else {
      int remain = capacity - currentWeight;
      finalValue += item.value * (remain / item.weight);
      break;
    }
  }

  return finalValue;
}

void main() {
  List<Item> items = [
    Item(60, 10),
    Item(100, 20),
    Item(120, 30)
  ];
  int capacity = 50;

  print("Maximum value we can obtain = ${fractionalKnapsack(capacity, items)}");
}
