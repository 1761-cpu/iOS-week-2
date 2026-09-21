import Foundation

struct Computer: Identifiable {
    let id = UUID()          // Unique ID
    var name: String         // e.g., "PC01"
    var location: String     // e.g., "Lab A"
    var isAvailable: Bool
}
