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
            VStack(spacing: 16) {

                // HEADER
                VStack(spacing: 8) {
                    Image(systemName: "desktopcomputer")
                        .font(.system(size: 48))
                        .foregroundColor(.indigo)

                    Text("COMPUTER LAB")
                        .font(.system(size: 25, weight: .bold, design: .monospaced))
                        .bold()

                    Text("Manage computers easily")
                        .font(.system(size: 15, weight: .semibold))
                        .italic()
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(Color.white.opacity(0.65))
                .background(
                    Image("bg1")
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.top, 10)

                // LIST
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
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.75))
                            .padding(.vertical, 4)
                        )
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .padding(.horizontal)

                // BUTTONS
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
                        .background(Color.indigo.opacity(0.77))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    NavigationLink {
                        CheckComputerView(computers: computers)
                    } label: {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Check").font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.green.opacity(0.77))
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
                        .background(Color.yellow.opacity(0.77))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                Text("Total computers: \(computers.count)")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.gray)
                    .padding(.bottom)
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
}

#Preview {
    ContentView()
}
