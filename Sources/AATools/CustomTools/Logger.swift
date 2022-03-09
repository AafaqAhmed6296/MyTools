





public struct Debug {
    public static func log(message: String, variable: Any?...) {
        if variable.first == nil {
            print("MyDEBUG, \(message)")
        }else{
            print("MyDEBUG, \(message):", variable)
        }
    }
}
