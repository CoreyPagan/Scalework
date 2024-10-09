#Exercise 1-3

sandwich_orders = ["Chicken Sandwich", "Tuna Sandwich", "Ham Sandwich", "Pastrami Sandwich", "Pastrami Sandwich", "Pastrami Sandwich"]

finished_sandwiches = []

print("Unfortunately The Deli has run out of Pastrami Sandwiches\n")

while "Pastrami Sandwich" in sandwich_orders:
    sandwich_orders.remove("Pastrami Sandwich")


while sandwich_orders:
    current_sandwich = sandwich_orders.pop()
    print(f"I made your {current_sandwich}.")
    finished_sandwiches.append(current_sandwich)

print(f"\nI have made these Sandwiches for you:\n")

for sandwich in finished_sandwiches:
    print(f"{sandwich}")

print(f"\nThanks for eating at CloudGrill. Please take the following poll and have a chance to earn a dream vacation!")

vacation_spots = []
