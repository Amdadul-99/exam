import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    print("Enter student ID (or type 'exit' to stop): ");
    String id = stdin.readLineSync()!;

    // Check if ID already exists
    if (students.any((student) => student['id'] == id)) {
      print("This ID already exists. Try a different one.");
      continue;
    }

    if (id.toLowerCase() == 'exit') break;

    print("Enter student name: ");
    String name = stdin.readLineSync()!;

    print("Enter student score: ");
    double score = double.parse(stdin.readLineSync()!);

    // Grade calculation
    String grade;
    if (score >= 90)
      grade = 'A+';
    else if (score >= 80)
      grade = 'A';
    else if (score >= 70)
      grade = 'B';
    else if (score >= 60)
      grade = 'C';
    else if (score >= 50)
      grade = 'D';
    else
      grade = 'F';

    // Store record
    students.add({'id': id, 'name': name, 'score': score, 'grade': grade});
    print("Student record added successfully!\n");
  }

  // Sort by score (descending)
  students.sort((a, b) => b['score'].compareTo(a['score']));

  // Display results
  print("\n===== Student Records (Sorted by Score) =====");
  for (var student in students) {
    print(
      "ID: ${student['id']}, Name: ${student['name']}, Score: ${student['score']}, Grade: ${student['grade']}",
    );
  }

  // Total students
  print("\nTotal number of students: ${students.length}");

  if (students.isNotEmpty) {
    // Highest and Lowest scores
    double highest = students.first['score'];
    double lowest = students.last['score'];

    print("Highest score: $highest");
    print("Lowest score: $lowest");
  }
}
