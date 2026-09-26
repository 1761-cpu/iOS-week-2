import SwiftUI

struct CheckComputerView: View {
    let computers: [Computer]
    @State private var searchName: String = ""
    @State private var isFound: Bool = false
    @State private var showResult: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            TextField("Enter computer name (e.g. PC03)", text: $searchName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                if computers.contains(where: { $0.name.lowercased() == searchName.lowercased() }) {
                    isFound = true
                } else {
                    isFound = false
                }
                showResult = true
            }) {
                Text("Check")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.indigo.opacity(0.77))
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            if showResult {
                HStack {
                    Image(systemName: isFound ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(isFound ? .green : .red)
                    
                    Text(isFound ? "\(searchName) is in the lab!" : "\(searchName) is not in the lab!")
                        .foregroundColor(isFound ? .green : .red)
                        .font(.headline)
                }
                .padding()
                .background(isFound ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.top, 40)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("CHECK COMPUTER")
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
