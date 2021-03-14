//
//  StudentData.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import Foundation
import Combine
import SwiftUI
import UIKit

final class studentData: ObservableObject {
    @Published var students: [Student] = load("data.json")
    @Published var images: [String:UIImage] = [:]
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
