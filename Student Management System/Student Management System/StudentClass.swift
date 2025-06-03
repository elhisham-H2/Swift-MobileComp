//
// Student Management System
// Student Class
// Created by Hisham El-Shiraida
// Student Number: 991750966
//

import Foundation

// The Student class represents a student with an ID, name, and a list of grades.
class Student {
    // Student ID number
    var id: Int
    // Student full name
    var name: String
    // List of grades as Double values
    var grades: [Double]
    
    // Initializes a new Student object with ID, name, and grades.
    init(id: Int, name: String, grades: [Double]) {
        self.id = id
        self.name = name
        self.grades = grades
    }
    
    // Calculates the average grade of the student.
    // Returns 0.0 if there are no grades.
    func average() -> Double {
        var sum = 0.0
        for grade in grades {
            sum += grade
        }
        return grades.isEmpty ? 0.0 : sum / Double(grades.count)
    }
    
    // Checks if the student's average grade meets or exceeds the given threshold.
    func isPassing(threshold: Double) -> Bool {
        return average() >= threshold
    }
    
    // Returns a formatted string with the student's ID, name, and grades.
    func summary() -> String {
        return "Student ID: \(id), Name: \(name), Grades: \(grades)"
    }
}
