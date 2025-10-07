import SwiftUI

struct FeatureDetailView: View {
    @ObservedObject var client: SupabaseClient
    let feature: Feature
    let appId: String

    @State private var newCommentAuthor = ""
    @State private var newCommentText = ""
    @State private var isAddingComment = false
    @State private var showCommentForm = false

    var currentFeature: Feature {
        client.features.first(where: { $0.id == feature.id }) ?? feature
    }

    var body: some View {
        ZStack {
            #if os(iOS)
            Color(UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0))
                .ignoresSafeArea()
            #else
            Color(NSColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0))
                .ignoresSafeArea()
            #endif

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                // Header Card
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 12) {
                            StatusBadge(status: currentFeature.status)

                            Text(currentFeature.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.primary)

                            Text(relativeDate(from: currentFeature.createdAt))
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        // Vote Button - Same style as list view
                        VStack(spacing: 6) {
                            Button(action: {
                                Task {
                                    await client.upvoteFeature(currentFeature)
                                }
                            }) {
                                Image(systemName: "arrow.up")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(width: 36, height: 36)
                            }
                            .disabled(client.hasVotedForFeature(currentFeature.id))

                            Text("\(currentFeature.votesCount)")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 18)
                        .padding(.horizontal, 14)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.2, green: 0.5, blue: 0.95),
                                    Color(red: 0.3, green: 0.6, blue: 1.0)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(16)
                        .opacity(client.hasVotedForFeature(currentFeature.id) ? 0.6 : 1.0)
                    }
                }
                .padding(20)
                #if os(iOS)
                .background(Color(UIColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
                #else
                .background(Color(NSColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
                #endif
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.top)

                // Description Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Beschreibung")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.secondary)

                    Text(currentFeature.description)
                        .font(.system(size: 15))
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }
                .padding(20)
                #if os(iOS)
                .background(Color(UIColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
                #else
                .background(Color(NSColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
                #endif
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
                .padding(.horizontal)

                // Comments Section
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Kommentare (\(currentFeature.comments?.count ?? 0))")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.primary)

                        Spacer()

                        Button(action: { showCommentForm.toggle() }) {
                            HStack(spacing: 6) {
                                Image(systemName: "plus.circle.fill")
                                Text("Kommentar")
                            }
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.2, green: 0.5, blue: 0.95),
                                        Color(red: 0.3, green: 0.6, blue: 1.0)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Comment Form
                    if showCommentForm {
                        VStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Name")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.secondary)

                                TextField("Dein Name", text: $newCommentAuthor)
                                    .textFieldStyle(.plain)
                                    .padding(12)
                                    #if os(iOS)
                                    .background(Color(.systemGray6))
                                    #else
                                    .background(Color(NSColor.controlBackgroundColor))
                                    #endif
                                    .cornerRadius(10)
                            }

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Kommentar")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(.secondary)

                                TextEditor(text: $newCommentText)
                                    .frame(height: 100)
                                    .padding(8)
                                    #if os(iOS)
                                    .background(Color(.systemGray6))
                                    #else
                                    .background(Color(NSColor.controlBackgroundColor))
                                    #endif
                                    .cornerRadius(10)
                            }

                            HStack(spacing: 12) {
                                Button("Abbrechen") {
                                    showCommentForm = false
                                    newCommentAuthor = ""
                                    newCommentText = ""
                                }
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                #if os(iOS)
                                .background(Color(.systemGray6))
                                #else
                                .background(Color(NSColor.controlBackgroundColor))
                                #endif
                                .cornerRadius(10)

                                Spacer()

                                Button(action: addComment) {
                                    if isAddingComment {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                            .tint(.white)
                                    } else {
                                        Text("Kommentieren")
                                            .font(.system(size: 14, weight: .semibold))
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 0.2, green: 0.5, blue: 0.95),
                                            Color(red: 0.3, green: 0.6, blue: 1.0)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(10)
                                .opacity((!isCommentFormValid || isAddingComment) ? 0.5 : 1.0)
                                .disabled(!isCommentFormValid || isAddingComment)
                            }
                        }
                        .padding(20)
                        #if os(iOS)
                        .background(Color(UIColor(red: 0.20, green: 0.20, blue: 0.22, alpha: 1.0)))
                        #else
                        .background(Color(NSColor(red: 0.20, green: 0.20, blue: 0.22, alpha: 1.0)))
                        #endif
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
                        .padding(.horizontal)
                    }

                    // Comments List
                    if let comments = currentFeature.comments, !comments.isEmpty {
                        VStack(spacing: 12) {
                            ForEach(comments.sorted(by: { $0.createdAt > $1.createdAt })) { comment in
                                CommentView(comment: comment)
                            }
                        }
                        .padding(.horizontal)
                    } else if !showCommentForm {
                        VStack(spacing: 12) {
                            Image(systemName: "bubble.left")
                                .font(.largeTitle)
                                .foregroundColor(.gray)

                            Text("Noch keine Kommentare")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text("Sei der Erste und kommentiere!")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                    }
                }
                .padding(.bottom)
            }
        }
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        }
    }

    private var isCommentFormValid: Bool {
        !newCommentAuthor.trimmingCharacters(in: .whitespaces).isEmpty &&
        !newCommentText.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private func addComment() {
        isAddingComment = true

        Task {
            let success = await client.addComment(
                to: currentFeature,
                authorName: newCommentAuthor.trimmingCharacters(in: .whitespaces),
                text: newCommentText.trimmingCharacters(in: .whitespaces)
            )

            await MainActor.run {
                isAddingComment = false

                if success {
                    newCommentAuthor = ""
                    newCommentText = ""
                    showCommentForm = false
                }
            }
        }
    }

    private func relativeDate(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.locale = Locale(identifier: "de_DE")
        return "Eingereicht " + formatter.localizedString(for: date, relativeTo: Date())
    }
}

struct CommentView: View {
    let comment: Comment

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(comment.authorName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Text(relativeDate(from: comment.createdAt))
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }

            Text(comment.text)
                .font(.system(size: 14))
                .foregroundColor(.primary)
                .lineSpacing(3)
        }
        .padding(16)
        #if os(iOS)
        .background(Color(UIColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
        #else
        .background(Color(NSColor(red: 0.18, green: 0.18, blue: 0.20, alpha: 1.0)))
        #endif
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 1)
    }

    private func relativeDate(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        formatter.locale = Locale(identifier: "de_DE")
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
