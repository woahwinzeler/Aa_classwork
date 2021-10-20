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
    } 
}

Student.prototype.courseLoad = function () {
    // generate based on this.courses a hash where key: department name and value: credits 
}

function Course (courseName, department, numCredits) {
    this.courseName = courseName;
    this.department = department;
    this.numCredits = numCredits;
    this.students = [];
}







