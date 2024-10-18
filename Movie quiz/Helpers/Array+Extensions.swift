//
//  Array+Extensions.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 18.08.2024.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
