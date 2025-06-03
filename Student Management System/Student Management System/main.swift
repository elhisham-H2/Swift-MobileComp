//
// Assignment1: Swift Console Application
// Student Management System
// Created by Hisham El-Shiraida
// Student Number: 991750966
//

// This program implements a simple Student Management System using a console-based menu.
// Users can add students, view all records, calculate average grades, and see who is passing/failing.

import Foundation

// Array to store all student records
var students: [Student] = []

// Function to display the main menu options to the user
func showMenu() {
    print("""
    \n========= Student Management System =========
    1. Add a new student
    2. View all students
    3. Calculate grade point average for a student
    4. Display passing or failing students
    5. Exit
    ===============================================
    Enter your choice:
    """)
}

// Main program loop that continues until user chooses to exit
var running = true

while running {
    showMenu()
    if let choice = readLine() {
        // Option 1: Add a new student
        if choice == "1" {
            // Prompt for and validate student ID
            print("Enter student ID:")
            let idInput = readLine()
            if let idInput = idInput, let id = Int(idInput) {
                // Prompt for and validate student name
                print("Enter student name:")
                let name = readLine()
                if let name = name, !name.isEmpty {
                    // Prompt for and convert space-separated grades to Double array
                    print("Enter grades separated by spaces:")
                    let gradesInput = readLine()
                    if let gradesInput = gradesInput {
                        let grades = gradesInput.split(separator: " ").compactMap { Double($0) }
                        let student = Student(id: id, name: name, grades: grades)
                        students.append(student)
                        print("Student added successfully!")
                    } else {
                        print("Invalid grades.")
                    }
                } else {
                    print("Invalid name.")
                }
            } else {
                print("Invalid ID input.")
            }
        // Option 2: View all students
        } else if choice == "2" {
            print("\n--- Student List ---")
            if students.isEmpty {
                print("No students to display.")
            } else {
                for student in students {
                    print(student.summary())
                    print("\n")
                }
            }
        // Option 3: Calculate grade point average for a student
        } else if choice == "3" {
            // Find student by ID and display their average grade
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
            }
        // Option 4: Display passing or failing students
        } else if choice == "4" {
            // Ask user for grade threshold and list passing/failing students based on it
            print("Enter grade threshold:")
            let thresholdInput = readLine()
            if let thresholdInput = thresholdInput, let threshold = Double(thresholdInput) {
                print("\n--- Passing Students ---")
                for student in students where student.isPassing(threshold: threshold) {
                    print("\(student.name) (Average: \(String(format: "%.2f", student.average())))")
                }

                print("\n--- Failing Students ---")
                for student in students where !student.isPassing(threshold: threshold) {
                    print("\(student.name) (Average: \(String(format: "%.2f", student.average())))\n")
                }
            } else {
                print("Invalid threshold input.")
            }
        // Option 5: Exit the program
        } else if choice == "5" {
            print("Exiting the Student Management System. See you soon!")
            running = false
        } else {
            print("Invalid choice. Please choose a one of the avalible options.")
        }
    }
}
