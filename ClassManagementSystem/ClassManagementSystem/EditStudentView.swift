import SwiftUI

struct EditStudentView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var students: [Student]
    let student: Student
    
    @State private var newName: String
    @State private var newGpa: String
    @State private var showDeleteAlert: Bool = false
    
    init(students: Binding<[Student]>, student: Student) {
        self._students = students
        self.student = student
        self._newName = State(initialValue: student.name)
        self._newGpa = State(initialValue: String(format: "%.1f", student.gpa))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "pencil.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
                .padding(.top, 20)
            
            Text("ID: \(student.studentId)")
                .font(.headline)
                .foregroundColor(.gray)
            
            TextField("Enter new name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter new GPA", text: $newGpa)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            // Nút Update
            Button(action: {
                if let gpa = Double(newGpa) {
                    if let index = students.firstIndex(where: { $0.studentId == student.studentId }) {
                        students[index].name = newName
                        students[index].gpa = gpa
                    }
                    dismiss()
                }
            }) {
                Text("Update")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Nút Remove
            Button(action: {
                showDeleteAlert = true
            }) {
                Text("Remove Student")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("EDIT STUDENT")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
            }
        }
        .alert("Remove Student?", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Remove", role: .destructive) {
                students.removeAll { $0.studentId == student.studentId }
                dismiss()
            }
        } message: {
            Text("Are you sure you want to remove \(student.name)?")
        }
    }
}

#Preview {
    ContentView()
}
