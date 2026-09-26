import SwiftUI

struct AddStudentView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var students: [Student]
    
    @State private var studentId: String = ""
    @State private var name: String = ""
    @State private var gpa: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Image(systemName: "person.badge.plus")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                TextField("Enter student ID (e.g. S004)", text: $studentId)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter student name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter GPA (e.g. 8.5)", text: $gpa)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                Button(action: {
                    if !studentId.isEmpty && !name.isEmpty && !gpa.isEmpty {
                        let newStudent = Student(
                            studentId: studentId,
                            name: name,
                            gpa: Double(gpa) ?? 0.0
                        )
                        students.append(newStudent)
                        dismiss()
                    }
                }) {
                    Text("Add Student")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                // NÚT BACK Ở GÓC TRÁI
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                }
                
                // TIÊU ĐỀ Ở GIỮA
                ToolbarItem(placement: .principal) {
                    Text("ADD STUDENT")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
