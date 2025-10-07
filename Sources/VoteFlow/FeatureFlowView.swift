import SwiftUI

public struct FeatureFlowView: View {
    let appId: String

    @StateObject private var client = SupabaseClient()
    @State private var showSubmitSheet = false
    @Environment(\.colorScheme) private var colorScheme

    public init(appId: String) {
        self.appId = appId
    }

    public var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()

                FeatureListView(client: client, appId: appId)
                    .navigationTitle("Features & Feedback")
                    #if os(iOS)
                    .navigationBarTitleDisplayMode(.large)
                    #endif

                // Floating Action Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { showSubmitSheet = true }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 0.2, green: 0.6, blue: 0.95),
                                            Color(red: 0.25, green: 0.75, blue: 0.85)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                    }
                }
            }
            .sheet(isPresented: $showSubmitSheet) {
                SubmitFeatureView(client: client, appId: appId)
            }
        }
        #if os(iOS)
        .navigationViewStyle(.stack)
        #endif
    }

    private var backgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.16, green: 0.16, blue: 0.18)
            : Color(UIColor.systemBackground)
    }
}

#Preview {
    FeatureFlowView(appId: "demo-app-001")
}
