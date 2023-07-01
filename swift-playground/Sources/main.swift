import Vapor

let arguments = ["vapor", "serve", "--port", "1234"]
let app = try Application(.detect(arguments: arguments))
defer {
    app.shutdown()
}

app.get("") { req in
    "Hello World!"
}

try app.run()
