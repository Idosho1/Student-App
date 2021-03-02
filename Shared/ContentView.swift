//
//  ContentView.swift
//  Shared
//
//  Created by Ido Shoshani on 3/2/21.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var students = [Student(firstName: "Yehonatan", lastName: "Mileguir", gradeYear: "10th", averageScore: 94.3, studentPicture: Image("ProfileImage")),Student(firstName: "Tim", lastName: "Cook", gradeYear: "10th", averageScore: 94.3, studentPicture: Image("ProfileImage")),Student(firstName: "Tim", lastName: "Cook", gradeYear: "10th", averageScore: 94.3, studentPicture: Image("ProfileImage")),Student(firstName: "Tim", lastName: "Cook", gradeYear: "10th", averageScore: 64, studentPicture: Image("ProfileImage")),Student(firstName: "Tim", lastName: "Cook", gradeYear: "10th", averageScore: 73, studentPicture: Image("ProfileImage"))]
    
    var grades = ["All","A","B","C","D"]
    @State private var gradesIndex = 0
    
    @State private var animate = false
    
    var averageScore: Int {
        return Int(students.reduce(0, {$0 + $1.averageScore})/Double(students.count))
    }
    
    var averageFilteredScore: Int {
        return Int(filteredStudents.reduce(0, {$0 + $1.averageScore})/Double(filteredStudents.count))
    }
    
    var filteredStudents: [Student] {
        students.filter { student in
            switch grades[gradesIndex] {
            case "A": return (student.averageScore >= 90)
            case "B": return (student.averageScore >= 80 && student.averageScore < 90)
            case "C": return (student.averageScore >= 70 && student.averageScore < 80)
            case "D": return (student.averageScore >= 60 && student.averageScore < 70)
                default: return true
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("", selection: $gradesIndex) {
                    Text("All").tag(0)
                    Text("A").tag(1)
                    Text("B").tag(2)
                    Text("C").tag(3)
                    Text("D").tag(4)
                }.pickerStyle(SegmentedPickerStyle()).padding(.vertical, 5)
                
                if filteredStudents.count > 0 {
                    ForEach(filteredStudents) { student in
                        NavigationLink(destination: Text("Hello")) {
                            StudentListItem(student: student).padding(.vertical, 3)
                        }.transition(.slide)
                    }
                    if gradesIndex != 0 {
                        Text("\(filteredStudents.count) / \(students.count) Students Displayed").foregroundColor(.secondary)
                        Text("\(averageFilteredScore) Displayed Average / \(averageScore) Overall Average").foregroundColor(.secondary)
                    } else {
                        Text("\(students.count) Total Students").foregroundColor(.secondary)
                        Text("\(averageScore) Average Student Score").foregroundColor(.secondary)
                    }
                } else {
                    Text("No Students Found!").foregroundColor(.secondary)
                }
            }.navigationTitle("Students")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
