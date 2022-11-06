import Foundation

class NotePreviewPresenter {
    private unowned let view: NotePreviewViewController
    private let coordinator: NotePreviewCoordinatorProtocol
    private let notesProvider: NotesProvider
    private var note: Note?

    init(
        view: NotePreviewViewController,
        coordinator: NotePreviewCoordinatorProtocol,
        notesProvider: NotesProvider,
        note: Note?
    ) {
        self.view = view
        self.coordinator = coordinator
        self.notesProvider = notesProvider
        self.note = note
    }
}

extension NotePreviewPresenter {
    func viewDidLoad() {
        if let note = note {
            view.displayNote(note)
        }
    }

    func updatedNote(title: String?, text: String) {
        defer {
            coordinator.close()
        }
        
        if let note = note {
            let newNote = Note(
                id: note.id,
                title: title,
                text: text,
                creationDate: note.creationDate,
                lastModifyDate: Date()
            )

            notesProvider.updateNote(newNote)
        } else {
            let note = Note(
                title: title,
                text: text,
                creationDate: Date(),
                lastModifyDate: Date()
            )

            notesProvider.createNote(note)
        }
    }

    func delete() {
        defer {
            coordinator.close()
        }

        guard let note = note else {
            return
        }

        notesProvider.deleteNote(note)
    }
}
