//
// Student Management System
// Student Class
// Created by Hisham El-Shiraida
// Student Number: 991750966
//

import Foundation

class Student {
    var id: Int
    var name: String
    var grades: [Double]
    
    init(id: Int, name: String, grades: [Double]) {
        self.id = id
        self.name = name
        self.grades = grades
    }
    
    // Calculate the grade point average
    func average() -> Double {
        var sum = 0.0
        for grade in grades {
            sum += grade
        }
        return grades.isEmpty ? 0.0 : sum / Double(grades.count)
    }
    
    // Check if the student is pasaing or not
    func isPassing() -> Bool {
        return average() >= 50
    }
    
    func summary() -> String {
        return "ID: \(id), Name: \(name), Grades: \(grades)"
    }
}
