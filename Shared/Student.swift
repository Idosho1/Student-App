//
//  Student.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import Foundation
import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    
    var firstName: String // Names
    var lastName: String
    var gradeYear: String // 9th, 10th, 11th, 12th
    var averageScore: Double // 0.00 - 100.00
    var studentPicture: Image // SwiftUI Image Object
}

var students = [Student]()

