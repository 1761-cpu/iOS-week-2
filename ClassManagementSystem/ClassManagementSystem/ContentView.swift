import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = [
        Student(studentId: "S001", name: "An", gpa: 8.5),
        Student(studentId: "S002", name: "Bình", gpa: 7.8),
        Student(studentId: "S003", name: "Chi", gpa: 9.2),
        Student(studentId: "S004", name: "Dũng", gpa: 6.5),
        Student(studentId: "S005", name: "Minh", gpa: 8.0)
    ]
    
    @State private var searchText: String = ""
    @State private var showAddView: Bool = false
    @State private var showGood: Bool = false
    @State private var showTop: Bool = false
    
    // 0 = không sort, 1 = tăng dần, 2 = giảm dần
    @State private var sortMode: Int = 0  // Sắp xếp theo GPA
    
    // Filtered & Sorted students
    var displayedStudents: [Student] {
        var result = students

        // Search in Name/ID
        if !searchText.isEmpty {
            result = result.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.studentId.lowercased().contains(searchText.lowercased())
            }
        }
        
        // Show only Top GPA
        if showTop, let top = result.max(by: { $0.gpa < $1.gpa }) {
            result = [top]
        }
        
        // Filter GPA >= 8.0
        if showGood {
            result = result.filter { $0.gpa >= 8.0 }
        }
        
        // Sort by GPA
        if sortMode == 1 {
            result = result.sorted { $0.gpa < $1.gpa }   // Low → High
        } else if sortMode == 2 {
            result = result.sorted { $0.gpa > $1.gpa }   // High → Low
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                // HEADER
                VStack(spacing: 8) {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)
                    
                    Text("STUDENT MANAGER")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                    
                    Text("A better class, a brighter tomorrow")
                        .font(.system(size: 14, weight: .semibold))
                        .italic()
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.75))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.top, 8)
                
                // SEARCH FIELD
                TextField("Search by name or ID...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // QUICK ACTION BUTTONS
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        // Top GPA
                        Button(action: {
                            showTop.toggle()
                            if showTop { showGood = false }
                        }) {
                            Label("Top GPA", systemImage: "crown.fill")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(showTop ? Color.purple : Color.white.opacity(0.85))
                                .foregroundColor(showTop ? .white : .primary)
                                .cornerRadius(20)
                        }
                        
                        // GPA >= 8.0
                        Button(action: {
                            showGood.toggle()
                            if showGood { showTop = false }
                        }) {
                            Label("GPA ≥ 8", systemImage: "star.fill")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(showGood ? Color.yellow : Color.white.opacity(0.85))
                                .foregroundColor(showGood ? .white : .primary)
                                .cornerRadius(20)
                        }
                        
                        // Sort by GPA
                        Button(action: {
                            sortMode = (sortMode + 1) % 3 // phép chia lấy dư tạo vòng lặp: 0 → 1 → 2 → 0 -
                        }) {
                            Label(
                                sortMode == 0 ? "Sort GPA" : sortMode == 1 ? "Low → High" : "High → Low",
                                systemImage: sortMode == 1 ? "arrow.up" :
                                             sortMode == 2 ? "arrow.down" : "arrow.up.arrow.down"
                            )
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(sortMode == 0 ? Color.white.opacity(0.85) : Color.indigo)
                            .foregroundColor(sortMode == 0 ? .primary : .white)
                            .cornerRadius(20)
                        }
                        
                        // Reset
                        Button(action: {
                            showTop = false
                            showGood = false
                            sortMode = 0
                            searchText = ""
                        }) {
                            Label("Reset", systemImage: "arrow.counterclockwise")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.red.opacity(0.85))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // STUDENTS LIST
                List {
                    ForEach(displayedStudents) { student in
                        NavigationLink {
                            EditStudentView(students: $students, student: student)
                        } label: {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.blue)
                                
                                VStack(alignment: .leading) {
                                    Text(student.name)
                                        .font(.headline)
                                        .bold()
                                    Text("ID: \(student.studentId)")
                                        .font(.caption)
                                        .italic()
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text("GPA: \(String(format: "%.1f", student.gpa))")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(student.gpa >= 8.0 ? .green : .orange)
                            }
                            .padding(.vertical, 4)
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.9))
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                        )
                    }
                }
                .scrollContentBackground(.hidden)
                
                // ADD STUDENT BUTTON
                Button(action: {
                    showAddView = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Student")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Text("Total students: \(students.count)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 2)
                    .padding(.bottom, 8)
            }
            .sheet(isPresented: $showAddView) {
                AddStudentView(students: $students)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Image("bg1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
}
