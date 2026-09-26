import SwiftUI

struct AddComputerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var computers: [Computer]
    @State private var computerName: String = ""
    @State private var location: String = ""
    @State private var isAvailable: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "desktopcomputer")
                .font(.system(size: 60))
                .foregroundColor(.indigo)
            
            TextField("Enter computer name (e.g. PC06)", text: $computerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter location (e.g. Lab A)", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: $isAvailable) {
                Text("Available")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
            }
            
            Button(action: {
                if !computerName.isEmpty {
                    let newComputer = Computer(
                        name: computerName,
                        location: location,
                        isAvailable: isAvailable
                    )
                    
                    computers.append(newComputer)
                    
                    dismiss()
                }
            }) {
                Text("Add")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo.opacity(0.77))
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("ADD COMPUTER")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image("bg5")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
