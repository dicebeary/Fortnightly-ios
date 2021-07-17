//
//  ViewModelProtocol.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Foundation

protocol ViewModelManipulator {
    associatedtype Input
    associatedtype Output
    func map(from input: Input) -> Output
}
