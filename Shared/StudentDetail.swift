//
//  StudentDetail.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct StudentDetail: View {
    @EnvironmentObject var sData: studentData
    var student: Student

    var studentInd: Int {
        sData.students.firstIndex(where: { $0.id == student.id })!
    }

    var body: some View {
        ScrollView{
            
           sImage(studentImage: student.image)
                .padding()
                .frame(alignment: .center)
           
            VStack (alignment: .leading){
                
                
 
                HStack {
                    Text("\(student.lastName), \(student.firstName)")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                .padding(20)
                HStack{
                    
                    Text("    Average Score: \(String(format: "%.1f", student.averageScore))")
                    Spacer()
                    Text("Grade: \(student.gradeYear)    ")
                    
                }.padding(.bottom)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(height:1)
                
                Divider()

                Text("About \(student.firstName) \(student.lastName)")
                    .padding()
                    .font(Font.title2.weight(.heavy))
                VStack(alignment: .leading){
                    Text("Address: \(student.address)")
                    Spacer()
                    Text("Birthdate: \(student.birthdate)")
                    Spacer()
                    Text("Cell Number: \(student.cell)")
                    Spacer()
                    Text("Home Number: \(student.homeCell)")
                    Spacer()
                    Text("Parents: \(student.parents)")
                }
                .font(Font.subheadline.weight(.light))
                .padding()
            }
            .navigationTitle("\(student.lastName), \(student.firstName)")
            
        }
   }
}

struct StudentDetail_Previews: PreviewProvider {
    static let sData = studentData()
    static var previews: some View {
        StudentDetail(student: sData.students[1])
            .environmentObject(sData)
    }
}
