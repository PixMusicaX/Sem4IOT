class Item:
    def __init__(self, value, weight):
        self.value = value
        self.weight = weight
        self.ratio = value / weight


def fractional_knapsack(capacity, items):
    items.sort(key=lambda x: x.ratio, reverse=True)
    max_value = 0
    for item in items:
        if capacity == 0:
            return max_value
        elif item.weight <= capacity:
            capacity -= item.weight
            max_value += item.value
        else:
            max_value += capacity * item.ratio
            capacity = 0
    return max_value


if __name__ == "__main__":
    W = 15
    values = [1, 5, 10, 10, 5, 7, 8]
    weights = [3, 2, 5, 7, 2, 8, 4]
    items = [Item(values[i], weights[i]) for i in range(len(values))]
    n = len(weights)
    print("Fractional Knapsack in Python")
    print("Knapsack Capacity:", W)
    print("Item\tWeight\tValue")
    for i in range(n):
        print(f"{i+1}\t{weights[i]}\t{values[i]}")
    max_value = fractional_knapsack(W, items)
    print("Maximum profit:", max_value)