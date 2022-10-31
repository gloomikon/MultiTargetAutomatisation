import UIKit

class NotesCoordinator {

    // MARK: - Injected properties
    private unowned let rootNavigationController: UINavigationController
    private let factory: AbstractFactory
    private let coordinatorBuilder: CoordinatorBuilder

    init(
        rootNavigationController: UINavigationController,
        factory: AbstractFactory,
        coordinatorBuilder: CoordinatorBuilder
    ) {
        self.rootNavigationController = rootNavigationController
        self.factory = factory
        self.coordinatorBuilder = coordinatorBuilder
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

extension NotesCoordinator {
    func goToNotesPreview(with note: Note?) {
        coordinatorBuilder.buildNotePreviewCoordinator(
            rootNavigationContoller: rootNavigationController,
            note: note
        )
        .start(animated: true)
    }

    func goToNotesPreview() {
        goToNotesPreview(with: nil)
    }
}
