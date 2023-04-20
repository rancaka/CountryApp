//
//  Helpers.swift
//  Helpers
//
//  Created by adityo.rancaka on 2023/04/21.
//

@propertyWrapper
public struct Once<Value> {
    private var _wrappedValue: Value?
    public var wrappedValue: Value! {
        get { _wrappedValue }
        set {
            if _wrappedValue != nil { return }
            _wrappedValue = newValue
        }
    }

    public init() {}
}
