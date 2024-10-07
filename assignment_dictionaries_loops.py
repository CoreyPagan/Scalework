#Exercise 1

#Creating dicitonaries for each person
corey = {
    "OS": "Linux",
    "Hobbies": "Learning"
}

albert = {
    "OS": "Kubuntu",
    "Hobbies": "Coding"
}

jitendra = {
    "OS": "Windows",
    "Hobbies": "ML"
}

#Storing all 3 dictionaries in a list
people = [corey, albert, jitendra]

for person in people:
    print(person)


# Exercise 2


pet_1 = {
    "Name": "Bauer",
    "Type": "Dog",
    "Owner": "Corey"
}

pet_2 = {
    "Name": "Freya",
    "Type": "Dog",
    "Owner": "Corey"
}

pet_3 = {
    "Name": "Nike",
    "Type": "Cat",
    "Owner": "Corey"
}

pets = [pet_1, pet_2, pet_3]

for pet in pets:
    print(pet)



#Exercise 3

favorite_places = {
    "Corey": "North America",
    "Jitendra": "Asia",
    "Albert": "Africa"
}

for name, place in favorite_places.items():
    print(f"{name}'s favorite place is in the continent {place}\n")


#Exercise 4


cities = {
    "New York": {
        "Continent": "North America",
        "Country": "United States",
        "Population": "8.5 million",
        "Fact": "People don't use the garbage cans and it smells terrible but the pizza is good"
    },
    "Mumbai": {
        "Continent": "Asia",
        "Country": "India",
        "Population": "12.5 million",
        "Fact": "Financial Capital of India and is the heart of Bollywood"
    },
    "Lagos": {
        "Continent": "Africa",
        "Country": "Nigeria",
        "Population": "21 million",
        "Fact": "Has the tallest building in West Africa and it used to be the capital of Nigeria"
    }
}

for city, details in cities.items():
    print(f"\nCity: {city}")
    for key, value in details.items():
        print(f"{key}: {value}")