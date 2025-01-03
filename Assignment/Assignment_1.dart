abstract class Role {
  void displayRole();
}

class Person {
  String name;
  int age;
  String address;
  Role role;


  Person(this.name, this.age, this.address, this.role);


  String getName() {
    return name;
  }

  int getAge() {
    return age;
  }

  String getAddress() {
    return address;
  }

  Role getRole() {
    return role;
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;


  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address, StudentRole());


  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0;
    int total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }


  void displayStudentInfo() {
    role.displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${calculateAverageScore()}');
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  void displayTeacherInfo() {
    role.displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Courses Taught:');
    coursesTaught.forEach((course) => print('- $course'));
  }
}

class StudentRole extends Role {
  @override
  void displayRole() {
    print('Role: Student');
  }
}

class TeacherRole extends Role {
  @override
  void displayRole() {
    print('Role: Teacher');
  }
}

void main() {

  List<int> studentScores = [90, 85, 82];
  Student student = Student('John Doe', 20, '123 Main St', 'S123', 'A', studentScores);

  List<String> teacherCourses = ['Math', 'English', 'Bangla'];
  Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T456', teacherCourses);

  print('Student Information:');
  print('\n');
  student.displayStudentInfo();

  print('\n');

  print('Teacher Information:');
  teacher.displayTeacherInfo();

}
