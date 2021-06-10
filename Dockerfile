FROM swift:5.3 as builder

WORKDIR /build

COPY Sources Sources
COPY Tests Tests
COPY Package@swift-5.3.swift Package.swift
COPY Package.resolved Package.resolved

RUN swift package resolve
RUN swift build --product Run --configuration release --enable-test-discovery
RUN ln -s `swift build --configuration release --show-bin-path` /build/bin

FROM swift:5.3

RUN mkdir /app
COPY --from=builder /build/bin/Run /app/Run
ENV DOCS_ARCHIVE /docs
EXPOSE 8080
CMD /app/Run