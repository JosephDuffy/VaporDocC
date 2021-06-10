# VaporDocC

`VaporDocC` provides middleware for use with [Vapor](https://github.com/vapor/vapor). To initialise the middleware pass in the path to your .doccarchive, e.g.:

```swift
let archiveURL = URL(fileURLWithPath: "/path/to/VaporDocC.doccarchive")
app.middleware.use(VaporDocCMiddleware(archivePath: archiveURL))
```
