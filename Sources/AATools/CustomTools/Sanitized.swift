//
//  File.swift
//  
//
//  Created by Aafaq on 09/12/2021.
//

import Foundation
/// This property wrapper can be use to sanitzed string for particular `CharacterSet`
///
/// To user this to wrap the property with this property wrapper, for example if you have a following property inside struct
/**
 ```
 struct Sanitize {
     var name: String = ""
     var number: String = ""
 }
 ```
 To wrap this, add wrapper in the begining in following syntax
 ```struct Sanitize {
 
 @Sanitized(CharacterSet.alphanumerics)
 var name: String = ""
 
 @Sanitized(CharacterSet.decimalDigits)
 var number: String = ""
}
 ```
 Then make a instance of struct like below
 ```
 var sanitizedName = Sanitize(name: "(Hello)", number: "(123) 456-7890") //Will give "Hello" for name value, and "1234567890" for number value.
 ```
 */
@propertyWrapper
public struct Sanitized {
    
    var value: String!
    let allowed: CharacterSet
    
    
    public var wrappedValue: String {
        get { value }
        set { value = newValue }
    }
    
    public init(wrappedValue: String, _ allowed: CharacterSet) {
        self.allowed = allowed
        self.value = wrappedValue.components(separatedBy: allowed.inverted).joined()
    }
}
