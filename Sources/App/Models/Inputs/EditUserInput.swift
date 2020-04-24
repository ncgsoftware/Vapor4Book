//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct EditUserInput: Content {
    let firstname: String?
    let lastname: String?
}
