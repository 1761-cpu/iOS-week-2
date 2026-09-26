import Foundation

struct Student: Identifiable {
    let id = UUID()
    var studentId: String
    var name: String
    var gpa: Double      
}
