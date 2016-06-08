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
