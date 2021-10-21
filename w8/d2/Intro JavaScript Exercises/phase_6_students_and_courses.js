function Student (firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.courses = [];
}

Student.prototype.name = function () {
    return `${this.firstName} ${this.lastName}`;
}

Student.prototype.enroll = function (course) {
    if (!(this.courses.includes(course)) && !this.hasConflict(course)) {
        this.courses.push(course);
        //update course list 
        course.addStudent(this);
    } 
}

Student.prototype.hasConflict = function (course) {
  for (let i = 0; i < this.courses.length; i++) {
    if (course.conflictsWith(this.courses[i])) {
      return true 
    }
  }
  return false 
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

function Course (courseName, department, numCredits, daysArr, timeBlock) {
    this.courseName = courseName;
    this.department = department;
    this.numCredits = numCredits;
    this.students = [];
    this.daysArr = daysArr;
    this.timeBlock = timeBlock;
}

Course.prototype.addStudent = function(student){
  this.students.push(student);
}

Course.prototype.conflictsWith = function (course) {
  let this_daysArr = this.daysArr;
  let other_daysArr = course.daysArr;
  // let conflicting_days = [];
  
  if (this.timeBlock != course.timeBlock) return false; 

  for (i = 0; i < this_daysArr.length; i++) {
    if (other_daysArr.includes(this_daysArr[i])) {
      return true;
    }
  }
}

