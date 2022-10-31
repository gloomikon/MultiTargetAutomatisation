import Foundation

class NotesListPresenter {

    private unowned let view: any NotesListViewProtocol
    private unowned let coordinator: NotesCoordinator
    private let notesProvider: NotesProvider

    init(
        view: any NotesListViewProtocol,
        coordinator: NotesCoordinator,
        notesProvider: NotesProvider
    ) {
        self.view = view
        self.coordinator = coordinator
        self.notesProvider = notesProvider
    }

    private var notes: [Note] = []

    private func updateNotes() {
        notes = notesProvider.getNotes()
        self.view.displayNotes(self.notes)
    }
}

extension NotesListPresenter {
    func viewDidLoad() {
        updateNotes()
    }

    func addNoteButtonTapped() {
        
    }

    func addNote(with title: String?, text: String) {
        let note = Note(
            title: title,
            text: text,
            creationDate: Date(),
            lastModifyDate: Date()
        )

        notesProvider.createNote(note)
        updateNotes()
    }

    func updateNote(at index: Int, title: String?, text: String) {
        let oldNote = notes[index]
        let newNote = Note(
            id: oldNote.id,
            title: title,
            text: text,
            creationDate: oldNote.creationDate,
            lastModifyDate: Date()
        )
        notesProvider.updateNote(newNote)
        updateNotes()
    }

    func deleteNote(at index: Int) {
        notesProvider.deleteNote(at: index)
        updateNotes()
    }
}
