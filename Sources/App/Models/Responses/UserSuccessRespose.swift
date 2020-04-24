//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct UserSuccessResponse: Content {
    let status: String = "success"
    let user: UserResponse
}
