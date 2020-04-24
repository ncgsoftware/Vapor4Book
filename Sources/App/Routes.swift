import Fluent
import Vapor
import SendGrid
import SimpleJWTMiddleware

    
// Make sure a service is working
func routes(_ app:Application,_ sendgridClient: SendGridClient) throws {
    print("In routes")
    let root = app.grouped(.anything, "users")
    let auth = root.grouped(SimpleJWTMiddleware())
    
    root.get("health") { request in
        return "All Good!"
    }
    
    //root.get("login") { request in
    //    return "All Good!"
    //}
   
    try auth.register(collection: AddressController())
    try root.register(collection: AuthController(sendgridClient))
    try auth.register(collection: UserController())
    
    print("Leaving routes")
}

