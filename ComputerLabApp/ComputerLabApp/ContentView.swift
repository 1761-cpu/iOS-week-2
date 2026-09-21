import SwiftUI

struct ContentView: View {
    @State private var computers: [Computer] = [
        Computer(name: "PC01", location: "Lab A", isAvailable: true),
        Computer(name: "PC02", location: "Lab A", isAvailable: true),
        Computer(name: "PC03", location: "Lab B", isAvailable: false),
        Computer(name: "PC04", location: "Lab B", isAvailable: true),
        Computer(name: "PC05", location: "Lab C", isAvailable: true)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg5")
                    .resizable()
                    .scaledToFill()
                
                VStack(spacing: 16) {
                    
                    VStack(spacing: 8) {
                        Image(systemName: "desktopcomputer")
                            .font(.system(size: 48))
                            .foregroundColor(.blue)
                        
                        Text("Computer Lab")
                            .font(.title2)
                            .bold()
                        
                        Text("Manage computers easily")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)
                    .frame(width: 380, height: 150)
                    .background(Color.white.opacity(0.6))
                    .background(
                        Image("bg1")
                            .resizable()
                            .scaledToFill()
                    )
                    
                    
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    

                    
                    VStack(spacing: 16) {
                        List(computers) { computer in
                            HStack {
                                Image(systemName: "desktopcomputer")
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading) {
                                    Text(computer.name)
                                        .font(.headline)
                                    Text(computer.location)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 6) {
                                    Circle()
                                        .fill(computer.isAvailable ? .green : .red)
                                        .frame(width: 10, height: 10)
                                    
                                    Text(computer.isAvailable ? "Available" : "In Use")
                                        .font(.caption)
                                        .foregroundColor(computer.isAvailable ? .green : .red)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .listRowBackground(Color.clear)
                            }
                            
                        }
                        .scrollContentBackground(.hidden)
                        .padding(.bottom, 10)
                        
                        
                        HStack(spacing: 12) {
                            NavigationLink {
                                AddComputerView(computers: $computers)
                            } label: {
                                VStack {
                                    Image(systemName: "plus")
                                    Text("Add").font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            NavigationLink {
                                CheckComputerView(computers: $computers)
                            } label: {
                                VStack {
                                    Image(systemName: "magnifyingglass")
                                    Text("Check").font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            NavigationLink {
                                StatisticsView(computers: computers)
                            } label: {
                                VStack {
                                    Image(systemName: "chart.bar.fill")
                                    Text("Stats").font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Total computers: \(computers.count)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                    .padding(.vertical)
           
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
