//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct LoginResponse: Content {
    let status = "success"
    let accessToken: String
    let refreshToken: String
    let user: UserResponse
}
