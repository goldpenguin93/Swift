<h2>It is Swift Tutorials.</h2>

https://www.tutorialspoint.com/swift 
https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

# Swift

Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, Linux and z/OS. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products. It is built with the open source LLVM compiler framework and has been included in Xcode since version 6. On Apple platforms it uses the Objective-C runtime library which allows C, Objective-C, C++ and Swift code to run within one program.

Apple intended Swift to support many core concepts associated with Objective-C, notably dynamic dispatch, widespread late binding, extensible programming and similar features, but in a "safer" way, making it easier to catch software bugs; Swift has features addressing some common programming errors like null pointer dereferencing and provides syntactic sugar to help avoid the pyramid of doom. Swift supports the concept of protocol extensibility, an extensibility system that can be applied to types, structs and classes, which Apple promotes as a real change in programming paradigms they term "protocol-oriented programming (similar to traits).

Swift was introduced at Apple's 2014 Worldwide Developers Conference (WWDC). It underwent an upgrade to version 1.2 during 2014 and a more major upgrade to Swift 2 at WWDC 2015. Initially a proprietary language, version 2.2 was made open-source software under the Apache License 2.0 on December 3, 2015, for Apple's platforms and Linux.[

Different major versions have been released annually with incompatible syntax and library invocations that require significant source code rewrites. For larger code bases this has caused many developers to dismiss Swift until a more stable version becomes available

Syntactic sugar
Under the Cocoa and Cocoa Touch environments, many common classes were part of the Foundation Kit library. This included the NSString string library (using Unicode), the NSArray and NSDictionary collection classes, and others. Objective-C provided various bits of syntactic sugar to allow some of these objects to be created on-the-fly within the language, but once created, the objects were manipulated with object calls. For instance, in Objective-C concatenating two NSStrings required method calls similar to this:

NSString *str = @"hello,";
str = [str stringByAppendingString:@" world"];
In Swift, many of these basic types have been promoted to the language's core, and can be manipulated directly. For instance, strings are invisibly bridged to NSString (when Foundation is imported) and can now be concatenated with the + operator, allowing greatly simplified syntax; the prior example becoming:

var str = "hello,"
str += " world"
Access control
Swift supports five access control levels for symbols: open, public, internal, fileprivate, and private. Unlike many object-oriented languages, these access controls ignore inheritance hierarchies: private indicates that a symbol is accessible only in the immediate scope, fileprivate indicates it is accessible only from within the file, internal indicates it is accessible within the containing module, public indicates it is accessible from any module, and open (only for classes and their methods) indicates that the class may be subclassed outside of the module

<h2>Optionals and chaining</h2>
An important new feature in Swift is option types, which allow references or values to operate in a manner similar to the common pattern in C, where a pointer may refer to a value or may be null. This implies that non-optional types cannot result in a null-pointer error; the compiler can ensure this is not possible.

Optional types are created with the Optional mechanism—to make an Integer that is nullable, one would use a declaration similar to var optionalInteger: Optional<Int>. As in C#,[44] Swift also includes syntactic sugar for this, allowing one to indicate a variable is optional by placing a question mark after the type name, var optionalInteger: Int?. Variables or constants that are marked optional either have a value of the underlying type or are nil. Optional types wrap the base type, resulting in a different instance. String and String? are fundamentally different types, the latter has more in common with Int? than String.

To access the value inside, assuming it is not nil, it must be unwrapped to expose the instance inside. This is performed with the ! operator:

    let myValue = anOptionalInstance!.someMethod()
In this case, the ! operator unwraps anOptionalInstance to expose the instance inside, allowing the method call to be made on it. If anOptionalInstance is nil, a null-pointer error occurs. This can be annoying in practice, so Swift also includes the concept of optional chaining to test whether the instance is nil and then unwrap it if it is non-null:

    let myValue = anOptionalInstance?.someMethod()
In this case the runtime only calls someMethod if anOptionalInstance is not nil, suppressing the error. Normally this requires the programmer to test whether myValue is nil before proceeding. The origin of the term chaining comes from the more common case where several method calls/getters are chained together. For instance:

    let aTenant = aBuilding.TenantList[5]
    let theirLease = aTenant.leaseDetails
    let leaseStart = theirLease?.startDate
can be reduced to:

   let leaseStart = aBuilding.TenantList.leaseDetails?.startDate
The ? syntax circumvents the pyramid of doom.

Swift 2 introduced the new keyword guard for cases in which code should stop executing if some condition is unmet:

    guard let leaseStart = aBuilding.TenantList[5]?.leaseDetails?.startDate else {
        //handle the error case where anything in the chain is nil
        //else scope must exit the current method or loop
    }
    //continue, knowing that leaseStart is not nil
Using guard has three benefits. While the syntax can act as an if statement, its primary benefit is inferring non-nullability. Where an if statement requires a case, guard assumes the case based on the condition provided. Also, since guard contains no scope, with exception of the else closure, leaseStart is presented as an unwrapped optional to the guard's super-scope. Lastly, if the guard statement's test fails, Swift requires the else to exit the current method or loop, ensuring leaseStart never is accessed when nil. This is performed with the keywords return, continue, break, or throw.

Objective-C was weakly typed, and allowed any method to be called on any object at any time. If the method call failed, there was a default handler in the runtime that returned nil. That meant that no unwrapping or testing was needed, the equivalent statement in Objective-C:

    leaseStart = [[[aBuilding tenantList:5] leaseDetails] startDate]
would return nil and this could be tested. However, this also demanded that all method calls be dynamic, which introduces significant overhead. Swift's use of optionals provides a similar mechanism for testing and dealing with nils, but does so in a way that allows the compiler to use static dispatch because the unwrapping action is called on a defined instance (the wrapper), versus occurring in the runtime dispatch system.

<h2>Value types</h2>
In many object-oriented languages, objects are represented internally in two parts. The object is stored as a block of data placed on the heap, while the name (or "handle") to that object is represented by a pointer. Objects are passed between methods by copying the value of the pointer, allowing the same underlying data on the heap to be accessed by anyone with a copy. In contrast, basic types like integers and floating point values are represented directly; the handle contains the data, not a pointer to it, and that data is passed directly to methods by copying. These styles of access are termed pass-by-reference in the case of objects, and pass-by-value for basic types.

Both concepts have their advantages and disadvantages. Objects are useful when the data is large, like the description of a window or the contents of a document. In these cases, access to that data is provided by copying a 32- or 64-bit value, versus copying an entire data structure. However, smaller values like integers are the same size as pointers (typically both are one word), so there is no advantage to passing a pointer, versus passing the value. Also, pass-by-reference inherently requires a dereferencing operation, which can produce noticeable overhead in some operations, typically those used with these basic value types, like mathematics.

Similarly to C# and in contrast to most other OO languages,[citation needed] Swift offers built-in support for objects using either pass-by-reference or pass-by-value semantics, the former using the class declaration and the latter using struct. Structs in Swift have almost all the same features as classes: methods, implementing protocols, and using the extension mechanisms. For this reason, Apple terms all data generically as instances, versus objects or values. Structs do not support inheritance, however.

The programmer is free to choose which semantics are more appropriate for each data structure in the application. Larger structures like windows would be defined as classes, allowing them to be passed around as pointers. Smaller structures, like a 2D point, can be defined as structs, which will be pass-by-value and allow direct access to their internal data with no dereference. The performance improvement inherent to the pass-by-value concept is such that Swift uses these types for almost all common data types, including Int and Double, and types normally represented by objects, like String and Array. Using value types can result in significant performance improvements in user applications as well.
To ensure that even the largest structs do not cause a performance penalty when they are handed off, Swift uses copy on write so that the objects are copied only if and when the program attempts to change a value in them. This means that the various accessors have what is in effect a pointer to the same data storage, but this takes place far below the level of the language, in the computer's memory management unit (MMU). So while the data is physically stored as one instance in memory, at the level of the application, these values are separate, and physical separation is enforced by copy on write only if needed.

<h2>Protocol-oriented programming</h2>
A key feature of Objective-C is its support for categories, methods that can be added to extend classes at runtime. Categories allow extending classes in-place to add new functions with no need to subclass or even have access to the original source code. An example might be to add spell checker support to the base NSString class, which means all instances of NSString in the application gain spell checking. The system is also widely used as an organizational technique, allowing related code to be gathered into library-like extensions. Swift continues to support this concept, although they are now termed extensions, and declared with the keyword extension. Unlike Objective-C, Swift can also add new properties accessors, types and enums to extant instances.

Another key feature of Objective-C is its use of protocols, known in most modern languages as interfaces. Protocols promise that a particular class implements a set of methods, meaning that other objects in the system can call those methods on any object supporting that protocol. This is often used in modern OO languages as a substitute for multiple inheritance, although the feature sets are not entirely similar. A common example of a protocol in Cocoa is the NSCopying protocol, which defines one method, copyWithZone, that implements deep copying on objects

In Objective-C, and most other languages implementing the protocol concept, it is up to the programmer to ensure that the required methods are implemented in each class. Swift adds the ability to add these methods using extensions, and to use generic programming (generics) to implement them. Combined, these allow protocols to be written once and support a wide variety of instances. Also, the extension mechanism can be used to add protocol conformance to an object that does not list that protocol in its definition

For example, a protocol might be declared called StringConvertible, which ensures that instances that conform to the protocol implement a toString method that returns a String. In Swift, this can be declared with code like this:

protocol StringConvertible {
    func toString() -> String
}
This protocol can now be added to String, with no access to the base class's source:

extension String: StringConvertible {
    func toString() -> String {
        return self
    }
}
In Swift, like many modern languages supporting interfaces, protocols can be used as types, which means variables and methods can be defined by protocol instead of their specific type:

var someSortOfPrintableObject: StringConvertible
...
print(someSortOfPrintableObject.toString())
It does not matter what sort of instance someSortOfPrintableObject is, the compiler will ensure that it conforms to the protocol and thus this code is safe. This syntax also means that collections can be based on protocols also, like let printableArray = [StringConvertible].

As Swift treats structs and classes as similar concepts, both extensions and protocols are extensively used in Swift's runtime to provide a rich API based on structs. For instance, Swift uses an extension to add the Equatable protocol to many of their basic types, like Strings and Arrays, allowing them to be compared with the == operator. A concrete example of how all of these features interact can be seen in the concept of default protocol implementations:

func !=<T : Equatable>(lhs: T, rhs: T) -> Bool
This function defines a method that works on any instance conforming to Equatable, providing a not equals function. Any instance, class or struct, automatically gains this implementation simply by conforming to Equatable. As many instances gain Equatable through their base implementations or other generic extensions, most basic objects in the runtime gain equals and not equals with no code.
This combination of protocols, defaults, protocol inheritance, and extensions allows many of the functions normally associated with classes and inheritance to be implemented on value types.[49] Properly used, this can lead to dramatic performance improvements with no significant limits in API. This concept is so widely used within Swift, that Apple has begun calling it a protocol-oriented programming language. They suggest addressing many of the problem domains normally solved though classes and inheritance using protocols and structs instead.

<h2>Libraries, runtime and development</h2>
Swift uses the same runtime as the extant Objective-C system, but requires iOS 7 or macOS 10.9 or higher.Swift and Objective-C code can be used in one program, and by extension, C and C++ also. In contrast to C, C++ code cannot be used directly from Swift. An Objective-C or C wrapper must be created between Swift and C++. In the case of Objective-C, Swift has considerable access to the object model, and can be used to subclass, extend and use Objective-C code to provide protocol support.The converse is not true: a Swift class cannot be subclassed in Objective-C

To aid development of such programs, and the re-use of extant code, Xcode 6 offers a semi-automated system that builds and maintains a bridging header to expose Objective-C code to Swift. This takes the form of an additional header file that simply defines or imports all of the Objective-C symbols that are needed by the project's Swift code. At that point, Swift can refer to the types, functions, and variables declared in those imports as though they were written in Swift. Objective-C code can also use Swift code directly, by importing an automatically maintained header file with Objective-C declarations of the project's Swift symbols. For instance, an Objective-C file in a mixed project called "MyApp" could access Swift classes or functions with the code #import "MyApp-Swift.h". Not all symbols are available through this mechanism, however—use of Swift-specific features like generic types, non-object optional types, sophisticated enums, or even Unicode identifiers may render a symbol inaccessible from Objective-C

Swift also has limited support for attributes, metadata that is read by the development environment, and is not necessarily part of the compiled code. Like Objective-C, attributes use the @ syntax, but the currently available set is small. One example is the @IBOutlet attribute, which marks a given value in the code as an outlet, available for use within Interface Builder (IB). An outlet is a device that binds the value of the on-screen display to an object in code.

<h2>Memory management</h2>
Swift uses Automatic Reference Counting (ARC) to manage memory. Apple used to require manual memory management in Objective-C, but introduced ARC in 2011 to allow for easier memory allocation and deallocation.[57] One problem with ARC is the possibility of creating a strong reference cycle, where objects reference each other in a way that you can reach the object you started from by following references (e.g. A references B, B references A). This causes them to become leaked into memory as they are never released. Swift provides the keywords weak and unowned to prevent strong reference cycles. Typically a parent-child relationship would use a strong reference while a child-parent would use either weak reference, where parents and children can be unrelated, or unowned where a child always has a parent, but parent may not have a child. Weak references must be optional variables, since they can change and become nil.

A closure within a class can also create a strong reference cycle by capturing self references. Self references to be treated as weak or unowned can be indicated using a capture list.

<h2>Debugging and other elements</h2>
A key element of the Swift system is its ability to be cleanly debugged and run within the development environment, using a read–eval–print loop (REPL), giving it interactive properties more in common with the scripting abilities of Python than traditional system programming languages. The REPL is further enhanced with the new concept playgrounds. These are interactive views running within the Xcode environment that respond to code or debugger changes on-the-fly.[59] Playgrounds allow programmers to add in Swift code along with markdown documentation. If some code changes over time or with regard to some other ranged input value, the view can be used with the Timeline Assistant to demonstrate the output in an animated way. In addition, Xcode has debugging features for Swift development including breakpoints, step through and step over statements, as well as UI element placement breakdowns for app developers.

Apple says that Swift is "an industrial-quality programming language that's as expressive and enjoyable as a scripting language".
Performance
Many of the features introduced with Swift also have well-known performance and safety trade-offs. Apple has implemented optimizations that reduce this overhead.


<h2>Reference site<h2>
https://www.wikipedia.org/
