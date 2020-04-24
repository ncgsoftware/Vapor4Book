//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct LoginInput: Content {
    let email: String
    let password: String
}
