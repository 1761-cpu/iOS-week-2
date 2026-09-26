#include <iostream>
#include <string>
using namespace std;

struct Student {
    string id;
    string name;
    double gpa;
};

int main() {
    Student students[100];
    int n = 0;
    int choice;

    while (true) {
        cout << "\n=== Student Management ===\n";
        cout << "1. Add student\n";
        cout << "2. Show all students\n";
        cout << "3. Exit\n";
        // Add more functions
        cout << "4. Remove student by ID\n";
        cout << "5. Update student's GPA\n";
        cout << "6. Find student with highest GPA\n";
        cout << "Choose an option: ";
        cin >> choice;

        if (choice == 1) {
            string id, name;
            double gpa;
            cout << "Enter id: ";
            cin >> id;
            cout << "Enter name: ";
            cin >> name;
            cout << "Enter GPA: ";
            cin >> gpa;

            // Fix errors: Add 2 missing assignments
            students[n].id = id;
            students[n].name = name;
            students[n].gpa = gpa;
            
            n = n + 1;
            cout << "Student added!\n";
        }
        
        // Complete the missing part to show all students
        else if (choice == 2) {
            if (n == 0) {
                cout << "No students to display.\n";
            } else {
                cout << "\n--- Student List ---\n";
                for (int i = 0; i < n; i++) {
                    cout << i + 1 << ". " << students[i].id
                         << " - " << students[i].name
                         << " - " << students[i].gpa << "\n";
                }
            }
        }
        
        else if (choice == 3) {
            cout << "Exiting program. Goodbye!\n";
            break;
        }
        
        // Remove student by ID
        else if (choice == 4) {
            string searchId;
            cout << "Enter ID to remove: ";
            cin >> searchId;
            bool found = false;
            
            for (int i = 0; i < n; i++) {
                if (students[i].id == searchId) {
                    // Dịch chuyển các phần tử phía sau lên để lấp chỗ trống
                    for (int j = i; j < n - 1; j++) {
                        students[j] = students[j + 1];
                    }
                    n--; // Giảm số lượng sinh viên
                    found = true;
                    cout << "Student removed successfully!\n";
                    break;
                }
            }
            if (!found) {
                cout << "Student with ID " << searchId << " not found.\n";
            }
        }
        
        // Update GPA
        else if (choice == 5) {
            string searchId;
            double newGpa;
            cout << "Enter ID to update GPA: ";
            cin >> searchId;
            bool found = false;
            
            for (int i = 0; i < n; i++) {
                if (students[i].id == searchId) {
                    cout << "Current GPA: " << students[i].gpa << "\n";
                    cout << "Enter new GPA: ";
                    cin >> newGpa;
                    students[i].gpa = newGpa;
                    found = true;
                    cout << "GPA updated successfully!\n";
                    break;
                }
            }
            if (!found) {
                cout << "Student with ID " << searchId << " not found.\n";
            }
        }
        
        // Find student with highest GPA
        else if (choice == 6) {
            if (n == 0) {
                cout << "No students in the list.\n";
            } else {
                int maxIndex = 0;
                for (int i = 1; i < n; i++) {
                    if (students[i].gpa > students[maxIndex].gpa) {
                        maxIndex = i;
                    }
                }
                cout << "\n--- Student with Highest GPA ---\n";
                cout << students[maxIndex].id << " - "
                     << students[maxIndex].name << " - "
                     << students[maxIndex].gpa << "\n";
            }
        }
        
        else {
            cout << "Invalid choice. Please try again.\n";
        }
    }

    return 0;
}
