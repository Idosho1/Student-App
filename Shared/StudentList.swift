//
//  StudentList.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import Foundation
import SwiftUI
import Combine

let coloredNavAppearance = UINavigationBarAppearance()

struct StudentList: View {
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    @EnvironmentObject var studentData: studentData
    
    var grades = ["All","A","B","C","D"]
    @State private var gradesIndex = 0
    @State var showAddButton = true
    @State private var showModal = false
    @State private var searchString = ""
    @State private var showSearch = false
    
    var students: [Student] {
        return studentData.students
    }
    
    var averageScore: Int {
        return Int(students.reduce(0, {$0 + $1.averageScore})/Double(students.count))
    }
    
    var averageFilteredScore: Int {
        return Int(filteredStudents.reduce(0, {$0 + $1.averageScore})/Double(filteredStudents.count))
    }
    
    var filteredStudents: [Student] {
        return students.filter { student in
            switch grades[gradesIndex] {
            case "A": return (student.averageScore >= 90)
            case "B": return (student.averageScore >= 80)
            case "C": return (student.averageScore >= 70)
            case "D": return (student.averageScore >= 60)
            default: return true
            }
        }.sorted { $0.firstName.lowercased() < $1.firstName.lowercased() }
        .filter({searchString.isEmpty ? true : $0.firstName.lowercased().contains(searchString.lowercased()) || $0.lastName.lowercased().contains(searchString.lowercased())})
    }
    
    var body: some View {
        ZStack {
            
            NavigationView {
                //Color.purple.ignoresSafeArea()
                //ZStack {
                List {
                    Section(header: Text("Filter Grade").textCase(.none)) {
                        VStack {
                            HStack {
                                Picker("", selection: $gradesIndex) {
                                    Text("All").tag(0)
                                    Text("A").tag(1)
                                    Text("B").tag(2)
                                    Text("C").tag(3)
                                    Text("D").tag(4)
                                }.pickerStyle(SegmentedPickerStyle()).padding(.vertical, 5)
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: 20, alignment: .leading)
                                        .padding(.horizontal, 5)
                                        .onTapGesture {
                                            withAnimation {
                                                showSearch.toggle()
                                            }
                                        }
                            }
                            if showSearch {
                                SearchBar(text: $searchString).padding(.bottom,4)
                                    .transition(.move(edge: .leading))
                            }
                                
                        }
                    }
                    
                    if filteredStudents.count > 0 {
                        Section(header: Text("Students").textCase(.none)) {
                            ForEach(filteredStudents) { student in
                            NavigationLink(destination: StudentDetail(student: student, showAddButton: self.$showAddButton)) {
                                StudentListItem(student: student).padding(.vertical, 3)
                            }
                        }.onDelete { IndexSet in
                            let idsToDelete = IndexSet.map { filteredStudents[$0].id } //ID of Student to Remove
                            studentData.students.removeAll(where: {$0.id == idsToDelete[0]}) //Remove Student with ID
                        }
                    }
                        Section(header: Text("Details").textCase(.none)) {
                            if filteredStudents.count != students.count {
                                Text("\(filteredStudents.count) / \(students.count) Students Displayed").foregroundColor(.secondary)
                                Text("\(averageFilteredScore) Displayed Average / \(averageScore) Overall Average").foregroundColor(.secondary)
                            } else {
                                Text("\(students.count) Total Students").foregroundColor(.secondary)
                                Text("\(averageScore) Average Student Score").foregroundColor(.secondary)
                            }
                        }
                    } else {
                        Section(header: Text("Details").textCase(.none)) {
                            Text("No Students Found!").foregroundColor(.secondary)
                        }
                    }
                }.navigationTitle("Student Directory")
            }.accentColor(.white)
            
            if showAddButton {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {self.showModal.toggle()}) {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                        }
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.bottom,6)
                        .padding(.trailing,20)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                        .transition(.move(edge: .bottom))
                    }
                }
                .sheet(isPresented: $showModal) {AddStudent(showModal: self.$showModal)}
            }
        }
    }
}

struct StudentList_Previews: PreviewProvider {
    static var previews: some View {
        StudentList()
            .environmentObject(studentData())
    }
}
