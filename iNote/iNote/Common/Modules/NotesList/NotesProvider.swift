class NotesProvider {

    @Storage(key: "notes_list", defaultValue: [])
    private var notes: [Note]

    func getNotes() -> [Note] {
        notes.sorted { $0.lastModifyDate < $1.lastModifyDate }
    }

    func createNote(_ note: Note) {
        notes.append(note)
    }

    func updateNote(_ note: Note) {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else {
            return
        }

        notes[index] = note
    }

    func deleteNote(at index: Int) {
        notes.remove(at: index)
    }
}
