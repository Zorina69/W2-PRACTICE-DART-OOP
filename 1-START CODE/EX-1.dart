enum Skill { FLUTTER, DART, OTHER }

class Address{
  String street, city, zipCode;
  Address(this.street, this.city, this.zipCode);

  @override
  String toString() => '$street, $city, $zipCode';
}

class YearOfExperience{
  int experience;
  YearOfExperience(this.experience);
}

class Employee {
  final Address address;
  final YearOfExperience yearExperience;
  final List<Skill> skills;
  final String name;
  final double baseSalary;

  Employee(this.name, this.baseSalary, this.address, this.yearExperience, this.skills);

  // Named constructor for a mobile developer
  Employee.mobileDeveloper({
    required this.name,
    required this.address,
    required this.yearExperience,
  })  : baseSalary = 40000,
        skills = [Skill.FLUTTER, Skill.DART];  

 // Named constructor for other employees
  Employee.other({
    required this.name,
    required this.address,
    required this.yearExperience,
  })  : baseSalary = 40000,
        skills = [Skill.OTHER];

  double computeSalary() {
    double salary = baseSalary + (yearExperience.experience * 2000);

    for (var skill in skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  // Print employee details
  void printDetails() {
    print('Employee: $name');
    print('Address: $address');
    print('Years of Experience: ${yearExperience.experience}');
    print('Skills: ${skills.map((s) => s.name).join(', ')}');
    print('Total Salary: \$${computeSalary().toStringAsFixed(2)}');
    print('-----------------------------');
  }
}

void main() {
  var add1 = Address("110", "Phnom Penh", "123F45");
  var yearExp = YearOfExperience(4);

  var emp1 = Employee.mobileDeveloper(name: "Sokea", address: add1, yearExperience: yearExp);
  emp1.printDetails();

  var emp2 = Employee.other(name: 'Ronan', address:add1, yearExperience: yearExp);
  emp2.printDetails();
}