


public struct Debug {
    public static var isDebugModeEnable = true
    
    public static func log(message: String, values: Any? ) {
        
        guard isDebugModeEnable else {
            return
        }
        
        if let variable = values {
            print("MyDEBUG, \(message): \(variable)")
        } else {
            print("MyDEBUG, \(message)")
        }

    }
    
    @available(*, deprecated, message: "variable parameter is changed to value, use value instead", renamed: "log(message:values:)")
    public static func log(message: String, variable: Any? ) {
        
        guard isDebugModeEnable else {
            return
        }
        
        if let variable = variable {
            print("MyDEBUG, \(message): \(variable)")
        } else {
            print("MyDEBUG, \(message)")
        }

    }
    
    public static func log(message: String, values: Any
                           ...) {
        guard isDebugModeEnable else {
            return
        }
        
        if values.isEmpty  {
            print("MyDEBUG, \(message)")
        }else{
            var string = "MyDEBUG, \(message): "
            let count = values.count - 1
            var i = 0
            for value in values {
                
                if count == i {
                    string += "\(value)"
                } else {
                    string += "\(value), "
                }
                
                i += 1
            }
            print(string)
        }
    }
}
