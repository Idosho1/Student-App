//
//  StudentListItem.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct StudentListItem: View {
    var student: Student
    
    var body: some View {
        HStack {
            student.studentPicture
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                //.padding(.horizontal)
            Text("\(student.firstName) \(student.lastName)")
            Spacer()
            //GradeBar(grade: student.averageScore)
            Spacer()
        }
    }
}

struct StudentListItem_Previews: PreviewProvider {
    static var previews: some View {
        StudentListItem(student: Student(firstName: "Tim", lastName: "Cook", gradeYear: "10th", averageScore: 94.3, studentPicture: Image("ProfileImage")))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
