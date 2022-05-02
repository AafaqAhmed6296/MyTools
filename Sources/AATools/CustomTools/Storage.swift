//
//  File.swift
//  
//
//  Created by Aafaq on 29/03/2022.
//


public class AppStorage<T: Decodable> {
    public let key: String
    
    public init(key: String) {
        self.key = key
    }
    
    public var value: T? {
        get {
            UserDefaults.standard.value(forKey: key) as? T
        } set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

extension AppStorage {
    public func save<U>(object: U) throws where U: Codable {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(object)
            self.value = encoded as? T
        } catch {
            throw error
        }
    }
    
    public func destroyself() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}



