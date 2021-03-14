//
//  AddStudent.swift
//  Student App
//
//  Created by Ido Shoshani on 3/14/21.
//

import SwiftUI

struct AddStudent: View {
    @Binding var showModal: Bool
    @EnvironmentObject var studentData: studentData
    
    @State private var grade = "9th"
    let grades = ["9th","10th","11th","12th"]
    
    @State private var showingAlert = false
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var score = ""
    @State private var address = ""
    @State private var cellNumber = ""
    @State private var homeNumber = ""
    @State private var parents = ""
    @State private var birthdate = Date()
    
    func highestID() -> Int {
        var highestID = 0
        for student in studentData.students {
            if student.id > highestID {
                highestID = student.id
            }
        }
        return highestID
    }
    
    func checkForm() -> Bool {
        if (firstName != "" && lastName != "" && score != "" && address != "" && cellNumber != "" && homeNumber != "" && parents != "") {
            return true
        }
        return false
    }
    
    func addStudent() {
        if checkForm() {
            let id = highestID() + 1
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            
            studentData.students.append(Student(id: id, firstName: firstName, lastName: lastName, gradeYear: grade, averageScore: Double(score)!, address: address, birthdate: formatter.string(from: birthdate), cell: cellNumber, parents: parents, homeCell: homeNumber, studentPictureName: "\(firstName)Pic"))
            studentData.students = studentData.students.sorted { $0.firstName.lowercased() < $1.firstName.lowercased() }
            showModal.toggle()
        } else {
            showingAlert = true
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section {
                    Picker("Grade", selection: $grade) {
                        ForEach(grades, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Score", text: $score)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    TextField("Address", text: $address)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    TextField("Cell Number", text: $cellNumber).keyboardType(.phonePad)
                    TextField("Home Number", text: $homeNumber).keyboardType(.phonePad)
                    TextField("Parents", text: $parents)
                }
                Button(action: {addStudent()}) {
                    Text("Add Student")
                }
            }
            .navigationBarTitle("Add New Student")
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Could not add student"), message: Text("Make sure all the fields are filled"), dismissButton: .default(Text("Retry")))
        }
    }
}

struct AddStudent_Previews: PreviewProvider {
    static var previews: some View {
        AddStudent(showModal: .constant(true))
    }
}
