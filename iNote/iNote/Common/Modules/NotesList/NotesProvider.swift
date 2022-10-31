import UIKit

class NotesProvider {

    static let shared = NotesProvider()

    @Storage(key: "notes_list", defaultValue: [])
    private var notes: [Note]

    func getNotes() -> [Note] {
        notes.sorted { $0.lastModifyDate > $1.lastModifyDate }
    }

    func createNote(_ note: Note) {
        notes.append(note)
        publishUpdate()
    }

    func updateNote(_ note: Note) {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else {
            return
        }

        notes[index] = note
        publishUpdate()
    }

    func deleteNote(_ note: Note) {
        notes.removeAll(where: { $0 == note })
        publishUpdate()
    }

    func deleteNote(at index: Int) {
        notes.remove(at: index)
        publishUpdate()
    }

    private func publishUpdate() {
        NotificationCenter.default.post(name: .notesUpdated, object: self)
    }
}

extension Notification.Name {
    static let notesUpdated: Notification.Name = .init("notesUpdated")
}
