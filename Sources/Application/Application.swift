import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()

    public init() throws {
    }

    func postInit() throws {
        // Capabilities
        initializeMetrics(app: self)

        // Endpoints
        initializeHealthRoutes(app: self)
        // For statuc things
        router.all("/static", middleware: StaticFileServer())
        
        router.get("/"){
            request, response, next in
            response.send("Hello Kitura!!")
            next()
        }
        
        router.get("/name/:name"){ request, response, _ in
            let name = request.parameters["name"] ?? "IDK Your name"
            try response.send("Hello \(name.capitalized)").end()

        }
        
        
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
