def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result
print("-" * 35)
print("Factorial Growth Table")
print("-" * 35)

for n in range(1, 11):
    print("Students:", n, "| Arrangements:", factorial(n))

print("\n For Heuristic Smart Approach")
students = ["Alice", "Bob", "Carol", "David", "Eve"]

same_city = {
    "Alice": "Kathmandu",
    "Bob": "Pokhara",
    "Carol": "Kathmandu",
    "David": "Pokhara",
    "Eve": "Chitwan"
}

#Heuristic: group by city and spread them out
print("Original order:", students)

sorted_students = sorted(students, key=lambda s: same_city[s])
print("After heuristic:", sorted_students)
print("Students from same city are now spread apart!")