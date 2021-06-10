# ``VaporDocC``

Vapor middleware that serves files from a DocC archive.

## Overview

Initialise the middleware, providing the path to your DocC archive, e.g.:

```swift
let archiveURL = URL(fileURLWithPath: "/path/to/VaporDocC.doccarchive")
app.middleware.use(VaporDocCMiddleware(archivePath: archiveURL))
```

## Topics

### Middleware

- ``VaporDocCMiddleware``
