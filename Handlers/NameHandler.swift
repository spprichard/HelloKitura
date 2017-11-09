import LoggerAPI
import Kitura

func sayHelloHandler(request: RouterRequest, response: RouterResponse, next: () -> Void) -> Void {
    let name = request.parameters["name"] ?? "IDK what your name is..."
    response.send("Hello \(name.capitalized)")
    next()
}
