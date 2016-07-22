# Polymorphic

Syntax for easily accessing values from generic data.

## Example

```swift
let genericData = "123"

let int = genericData.int ?? 0 // Type `Int`, value 123
```

Or a more complex example

```swift
let genericData = "1, 2, 3"

let array = genericData.array ?? [] // Type `[Polymoprhic]`, value ["1", "2", "3"]

for item in array {
	let int = item.int ?? 0 // Will cast all items to `Int`s
}
```

## Use

Include the following in your package to use Polymorphic.

```swift
.Package(url: "https://github.com/qutheory/polymorphic.git", majorVersion: x, minor: x)
```

## 🌏 Environment

|Polymorphic|Xcode|Swift|
|:-:|:-:|:-:|
|0.3.x|8.0 Beta **3**|DEVELOPMENT-SNAPSHOT-2016-07-20-qutheory|
|0.2.x|7.3.x|DEVELOPMENT-SNAPSHOT-2016-06-06-a|
|0.1.x|7.3.x|DEVELOPMENT-SNAPSHOT-2016-06-06-a|

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.qutheory.io) for instructions on how to install Swift 3. 

## 💧 Community

We pride ourselves on providing a diverse and welcoming community. Join your fellow Vapor developers in [our slack](slack.qutheory.io) and take part in the conversation.

## 🔧 Compatibility

Node has been tested on OS X 10.11, Ubuntu 14.04, and Ubuntu 15.10.