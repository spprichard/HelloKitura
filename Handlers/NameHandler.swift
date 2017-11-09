import Kitura
import LoggerAPI

func sayHelloHandler(request: RouterRequest, response: RouterResponse, next: ()->Void) -> Void{
    Log.info("Say Hello Handler")
    let name = request.parameters["name"] ?? "IDK Your name"
    try response.send("Hello \(name.capitalized)")
    next()
}

