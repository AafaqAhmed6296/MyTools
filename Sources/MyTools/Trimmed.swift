//
//  Trimmed.swift
//  
//
//  Created by Aafaq Ahmed on 23/06/2021.
//


import Foundation

///This property wrapper will truncate the leading and trailing spaces from string
///
///To use this you have to wrap the property with this property wrapper, for example if you have a following property
/**
 ```
 var title: String
 ```
 To wrap this just add the wrapper in the beginning in following syntax
```
 @Trimmed var title: String
```
*/
@propertyWrapper
public struct Trimmed {
    var value: String!
    let characterSet: CharacterSet
    
    public var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: characterSet) }
    }
    
    public init(wrappedValue: String) {
        self.characterSet = .whitespacesAndNewlines
        self.wrappedValue = wrappedValue
    }
}
