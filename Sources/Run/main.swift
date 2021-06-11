import Vapor
import VaporDocC

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
app.http.server.configuration.hostname = "0.0.0.0"

guard let archivePath = ProcessInfo.processInfo.environment["DOCS_ARCHIVE"] else {
    app.logger.critical("The DOCS_ARCHIVE environment variable is required")
    exit(1)
}
let archiveURL = URL(fileURLWithPath: archivePath)

let redirectRoot = ProcessInfo.processInfo.environment["REDIRECT_ROOT"]
let redirectMissingTrailingSlash = ProcessInfo.processInfo.environment["REDIRECT_MISSING_TRAILING_SLASH"] == "TRUE"

let middleware = VaporDocCMiddleware(
    archivePath: archiveURL,
    redirectRoot: redirectRoot,
    redirectMissingTrailingSlash: redirectMissingTrailingSlash
)
app.middleware.use(middleware)
try app.run()
