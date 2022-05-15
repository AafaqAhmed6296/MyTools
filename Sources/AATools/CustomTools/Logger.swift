

public func printd(_ values: Any...) {
    print("AADEBUG: ", terminator: "")
    for (index, value) in values.enumerated() {
        print(value, terminator: (index + 1) == values.count ? "\n" : ", ")
    }
}

public struct Debug {
    private static var debugMessage = "AADEBUG: "
    public static var isDebugModeEnable = true
    
    public static func log(message: String, values: Any? ) {
        
        guard isDebugModeEnable else {
            return
        }
        
        if let variable = values {
            print("\(debugMessage)\(message): \(variable)")
        } else {
            print("AADEBUG, \(message)")
        }

    }
    
    @available(*, deprecated, message: "variable parameter is changed to value, use value instead", renamed: "log(message:values:)")
    public static func log(message: String, variable: Any? ) {
        
        guard isDebugModeEnable else {
            return
        }
        
        if let variable = variable {
            print("\(debugMessage)\(message): \(variable)")
        } else {
            print("\(debugMessage)\(message)")
        }

    }
    
    @available(AAToolsTests, deprecated, message: "This is deprecated")
    public static func log(message: String, values: Any
                           ...) {
        guard isDebugModeEnable else {
            return
        }
        
        if values.isEmpty  {
            print("\(debugMessage)\(message)")
        }else{
            print("\(debugMessage)", terminator: "")
            for (index, value) in values.enumerated() {
                print(value, terminator: (index + 1) == values.count ? "\n" : ", ")
            }
        }
    }
}
