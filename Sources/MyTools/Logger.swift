





public struct Debug {
    public static func log(message: String, variable: Any?) {
        if variable == nil {
            print("MyDEBUG, \(message)")
        }else{
            print("MyDEBUG, \(message):", variable!)
        }
    }
}
