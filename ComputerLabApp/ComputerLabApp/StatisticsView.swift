import SwiftUI

struct StatisticsView: View {
    let computers: [Computer]
    
    var totalCount: Int {computers.count}
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "chart.bar.xaxis")
                .font(.system(size: 80))
                .foregroundColor(.yellow)
                .padding(.top, 10)
            
            HStack(spacing: 16) {
                Image(systemName: "desktopcomputer")
                    .font(.system(size: 28))
                    .foregroundColor(.indigo)
                
                VStack(alignment: .leading) {
                    Text("Total Computers")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.gray)
                    Text("\(totalCount)")
                        .font(.system(size: 28, weight: .bold, design: .monospaced))
                }
            }
            .padding()
            .background(Color.white.opacity(0.65))
            .cornerRadius(12)
            .padding(.horizontal)
            
            List(computers) { computer in
                HStack {
                    Image(systemName: "desktopcomputer")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text(computer.name)
                            .font(.headline)
                        Text(computer.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Circle()
                        .fill(computer.isAvailable ? .green : .red)
                        .frame(width: 10, height: 10)
                    
                    Text(computer.isAvailable ? "Available" : "In Use")
                        .font(.caption)
                        .foregroundColor(computer.isAvailable ? .green : .red)
                }
                .listRowBackground(Color.white.opacity(0.75))
            }
            .scrollContentBackground(.hidden)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("STATISTICS")
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
