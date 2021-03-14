//
//  StudentDetail.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct StudentDetail: View {
    @State private var showEditPrompt = false
    @EnvironmentObject var sData: studentData
    @State var student: Student
    @Binding var showAddButton: Bool
    
    var studentInd: Int {
        sData.students.firstIndex(where: { $0.id == student.id })!
    }
    
    func editScorePrompt() {
        showEditPrompt = true
    }

    var body: some View {
        ScrollView{
           sImage(studentImage: student.image)
                .padding()
                .padding(.top,20)
                .frame(alignment: .center)
            
            VStack {
                Divider().padding()
                HStack {
                    Text("Address").bold()
                    Spacer()
                    Text(student.address)
                }.padding(.horizontal,20).padding(.vertical,10)
                
                HStack {
                    Text("Birthdate").bold()
                    Spacer()
                    Text(student.birthdate)
                }.padding(.horizontal,20).padding(.vertical,10)
                
                HStack {
                    Text("Cell Number").bold()
                    Spacer()
                    Text(student.cell)
                }.padding(.horizontal,20).padding(.vertical,10)
                
                HStack {
                    Text("Home Number").bold()
                    Spacer()
                    Text(student.homeCell)
                }.padding(.horizontal,20).padding(.vertical,10)
                
                HStack {
                    Text("Parents").bold()
                    Spacer()
                    Text(student.parents)
                }.padding(.horizontal,20).padding(.vertical,10)
                
                HStack {
                    Text("Grade").bold().italic()
                    Spacer()
                    Text(student.gradeYear).italic()
                }.padding(.horizontal,20).padding(.top,60)
                
                HStack {
                    Text("Score").bold().italic()
                    Spacer()
                    HStack {
                        Image("edit").resizable().frame(width: 25, height: 25).onTapGesture {
                            editScorePrompt()
                        }.alert(isPresented: $showEditPrompt,TextAlert(title: "New Score", message: "Enter a new score below", keyboardType: .decimalPad) { result in
                                  if let newScoreString = result {
                                    if let newScore = Double(newScoreString) {
                                        student.averageScore = newScore
                                        sData.students[sData.students.firstIndex(where: {$0.id == student.id})!].averageScore = newScore
                                    }
                                  }
                        }).padding(.trailing, -255)
                        Text(String(format: "%.1f", student.averageScore)).italic()
                    }
                }.padding(.horizontal,20).padding(.vertical,10)
            }
            .navigationTitle("\(student.firstName) \(student.lastName)")
            
        }.onDisappear {
            showAddButton = true
        }.onAppear {
            showAddButton = false
        }
   }
}

struct StudentDetail_Previews: PreviewProvider {
    static let sData = studentData()
    static var previews: some View {
        StudentDetail(student: sData.students[1], showAddButton: .constant(true))
            .environmentObject(sData)
    }
}
