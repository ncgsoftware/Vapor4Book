//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct NewUserInput: Content {
    let firstname: String?
    let lastname: String?
    let email: String
    let password: String
}
