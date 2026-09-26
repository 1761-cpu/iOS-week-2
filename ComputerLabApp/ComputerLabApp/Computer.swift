import Foundation

struct Computer: Identifiable {
    let id = UUID()
    var name: String
    var location: String   
    var isAvailable: Bool
}
