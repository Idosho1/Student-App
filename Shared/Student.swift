//
//  Student.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import Foundation
import SwiftUI


struct Student: Decodable, Identifiable {
    var id: Int
    var firstName: String // Names
    var lastName: String
    var gradeYear: String // 9th, 10th, 11th, 12th
    var averageScore: Double // 0.00 - 100.00
    var address: String
    var birthdate: String
    var cell: String
    var parents: String
    var homeCell: String
    var studentPictureName: String
    var added: Bool = false
    
    var image: Image {
        Image(studentPictureName)
    }
}
