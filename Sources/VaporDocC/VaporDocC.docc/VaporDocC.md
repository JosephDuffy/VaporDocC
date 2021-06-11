# ``VaporDocC``

Vapor middleware that serves files from a DocC archive.

## Overview

Initialise the middleware, providing the path to your DocC archive, e.g.:

```swift
let archiveURL = URL(fileURLWithPath: "/path/to/VaporDocC.doccarchive")
app.middleware.use(VaporDocCMiddleware(archivePath: archiveURL))
```

By default ``VaporDocCMiddleware`` will map requests with hardcoded prefixes to the DocC archive, following the rules outlined in the .htaccess file from the [WWDC21 talk "Host and automate your DocC documentation"](https://developer.apple.com/wwdc21/10236):

```apacheconf
# Enable custom routing.
RewriteEngine On

# Route documentation and tutorial pages.
RewriteRule ^(documentation|tutorials)\/.*$ SlothCreator.doccarchive/index.html [L]

# Route files within the documentation archive.
RewriteRule ^(css|js|data|images|downloads|favicon\.ico|favicon\.svg|img|theme-settings\.json|videos)\/.*$ SlothCreator.doccarchive/$0 [L]
```

The only difference is that `VaporDocCMiddleware` does not require a trailing slash when matching `favicon.ico`, `favicon.svg`, or `theme-settings.json`.

## Topics

### Middleware

- ``VaporDocCMiddleware``
