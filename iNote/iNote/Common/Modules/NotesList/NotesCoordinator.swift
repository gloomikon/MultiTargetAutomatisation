import UIKit

protocol NotesCoordinatorProtocol {
    func navigateToAddNote()
}

protocol NoteCoordinatorTemplate {
    func makeNoteCreationModule() -> UIViewController
    func navigateToNoteCreationModule(viewController: UIViewController)
}

extension NoteCoordinatorTemplate {
    func makeNoteCreationModule() {

    }
}

extension NotesCoordinatorProtocol where Self: NoteCoordinatorTemplate {
    func navigateToAddNote() {
        let viewController = makeNoteCreationModule()
        navigateToNoteCreationModule(viewController: viewController)
    }
}

class NotesCoordinator {

    // MARK: - Injected properties
    private unowned let rootNavigationController: UINavigationController
    private let factory: AbstractFactory

    init(
        rootNavigationController: UINavigationController,
        factory: AbstractFactory
    ) {
        self.rootNavigationController = rootNavigationController
        self.factory = factory
    }
}

extension NotesCoordinator: Coordinator {
    func start(animated: Bool) {
        let viewController = NotesListViewController()
        let presenter = NotesListPresenter(
            view: viewController,
            coordinator: self,
            notesProvider: factory.makeNotesProvider()
        )
        viewController.presenter = presenter
        viewController.title = "notes_list_screen_title".localized
        rootNavigationController.navigationBar.prefersLargeTitles = true

        rootNavigationController.setViewControllers([viewController], animated: animated)
    }
}
