import LoggerAPI
import Kitura

func sayHelloHandler(request: RouterRequest, response: RouterResponse, next: ()->Void) -> Void {
    Log.info("sayHelloHandler")
    let name = request.parameters["name"] ?? "IDK your name..."
    response.send("Hello \(name.capitalized)")
}
