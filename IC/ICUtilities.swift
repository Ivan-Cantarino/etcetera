// Created by Ivan Cantarino

import Foundation

// MARK: - Lazy Constructor
/**
	This function sits above everything and can instantiate any NSObject subclass that doesn’t need arguments passed to it’s init.
	A function’s return value can be generically inferred by the type it is being assigned to, for example func x<ReturnType>() -> ReturnType
	The last closure argument of a function can be written as a closure outside of the function, for example array.forEach { … }
	Closure arguments don’t need to be named; it’s possible to use $0 instead, for example array.compactMap { $0 }
	So now the property’s type only needs to appear once and we don’t need to create a variable in the scope of a closure that we call immediately!
*/
func create<T>(_ setup: ((T) -> Void)) -> T where T: NSObject {
	let obj = T()
	setup(obj)
	return obj
}
