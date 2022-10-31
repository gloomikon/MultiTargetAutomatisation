import Foundation

class NotesListPresenter {

    private unowned let view: any NotesListViewProtocol
    private let coordinator: NotesCoordinator
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

    @objc
    private func updateNotes() {
        notes = notesProvider.getNotes()
        self.view.displayNotes(self.notes)
    }
}

extension NotesListPresenter {
    func viewDidLoad() {
        updateNotes()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateNotes),
            name: .notesUpdated,
            object: nil
        )
    }

    func addNoteButtonTapped() {
        coordinator.goToNotesPreview()
    }

    func tappedNote(at index: Int) {
        let note = notes[index]
        coordinator.goToNotesPreview(with: note)
    }
}
