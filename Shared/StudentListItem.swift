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
            student.image
                .resizable()
                .aspectRatio(contentMode: .fill)
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
    static let sData = studentData()
    static var previews: some View {
        StudentListItem(student: sData.students[0])
            .environmentObject(sData)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

