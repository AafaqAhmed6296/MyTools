





public struct Debug {
    public static func log(message: String, variable: Any?) {
        if variable == nil {
            print("DEBUG, \(message)")
        }else{
            print("DEBUG, \(message):", variable!)
        }
    }
}
