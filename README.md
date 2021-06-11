# VaporDocC

`VaporDocC` provides middleware for use with [Vapor](https://github.com/vapor/vapor). To initialise the middleware pass in the path to your .doccarchive, e.g.:

```swift
let archiveURL = URL(fileURLWithPath: "/path/to/VaporDocC.doccarchive")
app.middleware.use(VaporDocCMiddleware(archivePath: archiveURL))
```

Documentation – hosted by the docker image included in this repo – is available at [vapordocc.josephduffy.co.uk](https://vapordocc.josephduffy.co.uk/).

## Docker

A docker image that wraps a Vapor app using the `VaporDocCMiddleware` is provided at [ghcr.io/josephduffy/vapordocc](https://github.com/users/JosephDuffy/packages/container/package/vapordocc).

To run locally mount the docs at `/docs`, e.g.:

```shell
docker run -p 8080:8080 -v /path/to/VaporDocC.doccarchive:/docs ghcr.io/josephduffy/vapordocc
```
