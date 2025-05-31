//
// Assignment1: Swift Console Application
// Student Management System
// Created by Hisham El-Shiraida
// Student Number: 991750966
//

import Foundation

var students: [Student] = []

func showMenu() {
    print("""
    ========= Student Management System =========
    1. Add a new student
    2. View all students
    3. Calculate grade point average for a student
    4. Display passing or failing students
    5. Exit
    =============================================
    Enter your choice: 
""")}

var running = true

while running {
    showMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter student ID:")
            guard let idInput = readLine(), let id = Int(idInput) else {
                print("Invalid ID input.")
                continue
            }

            print("Enter student name:")
            guard let name = readLine(), !name.isEmpty else {
                print("Invalid name.")
                continue
            }

            print("Enter grades separated by spaces:")
            guard let gradesInput = readLine() else {
                print("Invalid grades.")
                continue
            }

            let grades = gradesInput.split(separator: " ").compactMap { Double($0) }
            let student = Student(id: id, name: name, grades: grades)
            students.append(student)
            print("Student added successfully!")

        case "2":
            print("\n--- Student List ---")
            if students.isEmpty {
                print("No students to display.")
            } else {
                students.forEach { print($0.summary()) }
            }

        case "3":
            print("Enter student ID to calculate average:")
            guard let idInput = readLine(), let id = Int(idInput) else {
                print("Invalid ID.")
                continue
            }

            if let student = students.first(where: { $0.id == id }) {
                print("Average grade for \(student.name): \(String(format: "%.2f", student.average()))")
            } else {
                print("Student with ID \(id) not found.")
            }

        case "4":
            print("\n--- Passing Students ---")
            for student in students where student.isPassing() {
                print("\(student.name) (Average: \(String(format: "%.2f", student.average())))")
            }

            print("\n--- Failing Students ---")
            for student in students where !student.isPassing() {
                print("\(student.name) (Average: \(String(format: "%.2f", student.average())))")
            }

        case "5":
            print("Exiting the program. Goodbye!")
            running = false

        default:
            print("Invalid choice. Please select a valid option.")
        }
    }
}
