function Student (firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
}

Student.prototype.name = function () {
    return `${this.firstName} ${this.lastName}`;
}

Student.prototype.enroll = function (course) {
    if (!(this.courses.includes(course))) {
        this.courses.push(course);
        //update course list 
        course.addStudent(this);
    } 
}

Student.prototype.courseLoad = function () {
    // generate based on this courses a hash where key: department name and value: credits 
    let courseload = new Proxy({}, {
      get: function(obj, property){
        return obj.hasOwnProperty(property) ? obj[property] : 0; 
      }
    })
    this.courses.forEach(function(course){
      courseload[course.department] += course.numCredits
    });
    return courseload; 
}

function Course (courseName, department, numCredits) {
    this.courseName = courseName;
    this.department = department;
    this.numCredits = numCredits;
    this.students = [];
}

Course.prototype.addStudent = function(student){
  this.students.push(student);
}

let Student1 = new Student("Owen", "Winzeler");
let Student2 = new Student("Jacky", "Chen");

let Course1 = new Course("English 101", "English", 4);
let Course2 = new Course("AstroPhysics 244", "Math", 3);

Student1.enroll(Course1)
Student1.enroll(Course2)

console.log(Student1.courseLoad())






