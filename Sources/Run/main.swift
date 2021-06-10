import Vapor
import VaporDocC

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }

guard let archivePath = ProcessInfo.processInfo.environment["DOCS_ARCHIVE"] else {
    app.logger.critical("The DOCS_ARCHIVE environment variable is required")
    exit(1)
}
let archiveURL = URL(fileURLWithPath: archivePath)
app.middleware.use(VaporDocC(archivePath: archiveURL))
try app.run()
