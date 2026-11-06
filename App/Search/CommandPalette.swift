import SwiftUI

/// A compact, keyboard-first action picker. It deliberately shares the AppKit-backed
/// field used by Quick Open so ⌘K reliably accepts typing over both WebKit and AppKit editors.
struct CommandPaletteAction: Identifiable {
    let id: String
    let title: String
    let detail: String
    let symbol: String
    let perform: () -> Void
}

struct CommandPalette: View {
    let actions: [CommandPaletteAction]
    let onDismiss: () -> Void

    @State private var query = ""
    @State private var selectedIndex = 0

    private var matches: [CommandPaletteAction] {
        let needle = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !needle.isEmpty else { return actions }
        return actions.filter {
            $0.title.localizedCaseInsensitiveContains(needle) ||
            $0.detail.localizedCaseInsensitiveContains(needle)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            QuickOpenField(text: $query,
                           onMoveUp: { move(-1) },
                           onMoveDown: { move(1) },
                           onSubmit: runSelected,
                           onCancel: onDismiss)
                .frame(height: 26)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .onChange(of: query) { _, _ in selectedIndex = 0 }

            Divider()

            if matches.isEmpty {
                ContentUnavailableView("No Commands", systemImage: "command",
                                       description: Text("Try a different search."))
                    .frame(width: 560, height: 300)
            } else {
                ScrollViewReader { proxy in
                    List(Array(matches.enumerated()), id: \.element.id) { index, action in
                        Button { run(action) } label: {
                            HStack(spacing: 12) {
                                Image(systemName: action.symbol)
                                    .frame(width: 18)
                                    .foregroundStyle(.secondary)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(action.title)
                                    Text(action.detail).font(.caption).foregroundStyle(.secondary)
                                }
                                Spacer()
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .listRowBackground(index == selectedIndex ? Color.accentColor.opacity(0.16) : Color.clear)
                        .id(index)
                    }
                    .listStyle(.plain)
                    .frame(height: min(CGFloat(matches.count) * 54, 360))
                    .onChange(of: selectedIndex) { _, index in
                        proxy.scrollTo(index, anchor: .center)
                    }
                }
            }
        }
        .frame(width: 560)
    }

    private func move(_ delta: Int) {
        guard !matches.isEmpty else { return }
        selectedIndex = (selectedIndex + delta + matches.count) % matches.count
    }

    private func runSelected() {
        guard matches.indices.contains(selectedIndex) else { return }
        run(matches[selectedIndex])
    }

    private func run(_ action: CommandPaletteAction) {
        onDismiss()
        action.perform()
    }
}
