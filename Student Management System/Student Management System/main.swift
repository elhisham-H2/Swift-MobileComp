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
    ============================================
    Enter your choice:
    """)
    print("\n")
}

var running = true

while running {
    showMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter student ID:")
            let idInput = readLine()
            if let idInput = idInput, let id = Int(idInput) {
                print("Enter student name:")
                let name = readLine()
                if let name = name, !name.isEmpty {
                    print("Enter grades separated by spaces:")
                    let gradesInput = readLine()
                    if let gradesInput = gradesInput {
                        let grades = gradesInput.split(separator: " ").compactMap { Double($0) }
                        let student = Student(id: id, name: name, grades: grades)
                        students.append(student)
                        print("Student added successfully!")
                    } else {
                        print("Invalid grades.")
                        continue
                    }
                } else {
                    print("Invalid name.")
                    continue
                }
            } else {
                print("Invalid ID input.")
                continue
            }

        case "2":
            print("\n--- Student List ---")
            if students.isEmpty {
                print("No students to display.")
            } else {
                for student in students {
                    print(student.summary())
                    print("\n")
                }
            }

        case "3":
            print("Enter student ID to calculate average:")
            let idInput = readLine()
            if let idInput = idInput, let id = Int(idInput) {
                if let student = students.first(where: { $0.id == id }) {
                    print("Average grade for \(student.name): \(String(format: "%.2f", student.average()))")
                } else {
                    print("Student with ID \(id) not found.")
                }
            } else {
                print("Invalid ID.")
                continue
            }

        case "4":
            print("\n--- Passing Students ---")
            for student in students where student.isPassing() {
                print("\(student.name) (Average: \(String(format: "%.2f", student.average())))")
            }

            print("\n--- Failing Students ---")
            for student in students where !student.isPassing() {
                print("\(student.name) (Average: \(String(format: "%.2f", student.average())))\n")
            }

        case "5":
            print("Exiting the Student Management System. See you soon!")
            running = false

        default:
            print("Invalid choice. Please choose a one of the avalible options.")
        }
    }
}
