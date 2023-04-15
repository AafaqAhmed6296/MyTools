//
//  File.swift
//
//
//  Created by Aafaq on 29/03/2022.
//


import Foundation

///A class that provides an easy way to store and retrieve data in the user's default storage, with support for Codable types.
///
/// ```
/// //Usage
/// let nameStorage = AppStorage<String>(key: "name")
/// nameStorage.value = "John"
/// let retrievedName = nameStorage.value // "John"
/// ```
public class AppStorage<T: Codable> {
    
    /// The key to use for storing and retrieving data in the user's default storage.
    public let key: String
    
    /// Initializes a new instance of AppStorage with the specified key.
    /// - Parameter key: The key to use for storing and retrieving data in the user's default storage.
    public init(key: String) {
        self.key = key
    }
    
    /// The value stored in the user's default storage for the current key, with support for Codable types.
    public var value: T? {
        get {
            return UserDefaults.standard.value(forKey: key) as? T
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

extension AppStorage {
    ///  Saves an object of a custom Codable type to the user's default storage for the current key.
    ///- Parameter object: The object to save to the user's default storage.
    ///- Throws: An error if encoding the object to JSON fails.
    public func saveCustomType<U>(object: U) throws where U: Codable {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(object)
            self.value = encoded as? T
        } catch {
            throw error
        }
    }
    
    ///Saves an object of a custom Codable type to the user's default storage for the current key.
    /// - Parameter object: The object to save to the user's default storage.
    /// - Throws: An error if encoding the object to JSON fails.
    @available(*, deprecated, message: "`save` is renamed to `saveCustomType`", renamed: "saveCustomType(object:)")
    public func save<U>(object: U) throws where U: Codable {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(object)
            self.value = encoded as? T
        } catch {
            throw error
        }
    }
    
    ///Retrieves an object of a custom Codable type from the user's default storage for the current key.
    ///- Parameter type: The type of the object to retrieve from the user's default storage.
    ///- Returns: The retrieved object of the specified type.
    ///- Throws: An error if decoding the object from JSON fails.
    public func retrieve<U>(type: U.Type) throws -> U? where U: Codable {
        let decoder = JSONDecoder()
        do {
            guard let value = self.value else {
                return nil
            }
            let decoded = try decoder.decode(type, from: value as! Data)
            return decoded
        } catch {
            throw error
        }
    }
    
    /// Removes the current key and its associated value from the user's default storage.
    public func destroyself() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
