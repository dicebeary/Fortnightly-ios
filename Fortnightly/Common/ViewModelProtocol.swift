//
//  ViewModelProtocol.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    func map(from input: Input) -> Output
}
