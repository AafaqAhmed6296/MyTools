//
//  File.swift
//  
//
//  Created by Aafaq on 09/03/2022.
//

import Foundation

/// Add extension to this enum with custom fonts
///
/// Extend as Below
/// ```
/// extension AppFont {
///     static let font = AppFont(rawValue: "YourFontName")!
/// }
/// ```
public struct AppFont: RawRepresentable, Equatable, Hashable {
    public var rawValue: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public typealias RawValue = String
    
    public static let system = AppFont(rawValue: "system")!
}

