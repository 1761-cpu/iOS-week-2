import Foundation

struct Student: Identifiable {
    let id = UUID()
    var studentId: String   // e.g. "S001"
    var name: String        // e.g. "An"
    var gpa: Double         // e.g. 8.5
}
