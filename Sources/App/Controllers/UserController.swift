//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/16/20.
//

import Vapor
import Fluent

final class UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("profile", use: profile)
        routes.post("profile", use: save)
        //routes.delete("user", use: delete)
    }
    
    func profile(_ request: Request) throws -> EventLoopFuture<UserSuccessResponse> {
        return User.query(on: request.db)
            .filter(\.$id == request.payload.id)
            .all()
            .map{ users in
                return UserSuccessResponse(user: UserResponse(user: users.first!))
            }
    }
    
    func save(_ request: Request) throws -> EventLoopFuture<UserSuccessResponse> {
        
        let content = try request.content.decode(EditUserInput.self)
        
        return User.query(on: request.db).filter(\.$id == request.payload.id)
            .first()
            .flatMap { user in
                let user = user!
                
                if let name = content.firstname { user.firstname = name }
                
                if let name = content.lastname { user.lastname = name }
                
                return user.update(on: request.db)
                    .map { _ in
                        return UserSuccessResponse(user: UserResponse(user: user))
                    }
            }
    }
    
    
    
    func delete(_ request: Request) throws -> EventLoopFuture<HTTPStatus> {
        return User.query(on: request.db).filter(\.$id == request.payload.id)
            .first()
            .flatMap { user in
                let user = user!
                return Address.query(on: request.db)
                    .filter(\.$userId == user.id!)
                    .delete()
                    .flatMap{
                        return user.delete(on: request.db).transform(to: .ok)
                    }
            }
    }
 
}
