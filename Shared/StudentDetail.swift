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
            Color.blue.opacity(0.2)
                .ignoresSafeArea()
                .frame(height: 300)
 
        
            
           sImage(studentImage: student.image)
                .offset(y: -200)
                .padding(.bottom, -200)
                .frame(alignment: .center)
           
            VStack (alignment: .leading){
                
                
 
                HStack {
                    Text("\(student.lastName), \(student.firstName)")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                .padding(5)
                HStack{
                    Text("Average Score: \(student.averageScore)")
                    Spacer()
                    Text("Grade:\(student.gradeYear)")
                }
                .background(Color.blue.opacity(0.1))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(height:1)
                
                Divider()

                Text("About \(student.firstName) \(student.lastName)")
                    .font(.title3)
 
                VStack(alignment: .leading){
                    Text("Address: \(student.address)")
                    Text("Birthdate: \(student.birthdate)")
                    Text("Cell Number: \(student.cell)")
                    Text("Home Number: \(student.homeCell)")
                    Text("Parents: \(student.parents)")
                }
                .font(.subheadline)
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

