import UIKit

protocol NotePreviewCoordinatorTemplate {
    func createModule() -> UIViewController
    func navigateToModule(with viewController: UIViewController, animated: Bool)
}

extension NotePreviewCoordinatorTemplate where Self: Coordinator {
    func start(animated: Bool) {
        let viewController = createModule()
        navigateToModule(with: viewController, animated: animated)
    }
}

protocol NotePreviewCoordinatorProtocol {
    func close()
}

class BaseNotePreviewCoordinator {

    let rootNavigationController: UINavigationController
    let factory: AbstractFactory
    let note: Note?

    init(
        rootNavigationController: UINavigationController,
        factory: AbstractFactory,
        note: Note?
    ) {
        self.rootNavigationController = rootNavigationController
        self.factory = factory
        self.note = note
    }
}

extension NotePreviewCoordinatorTemplate where Self: BaseNotePreviewCoordinator, Self: NotePreviewCoordinatorProtocol {
    func createModule() -> UIViewController {
        let viewController = NotePreviewViewController()
        viewController.title = "note_preview_screen_name".localized
        let presenter = NotePreviewPresenter(
            view: viewController,
            coordinator: self,
            notesProvider: factory.makeNotesProvider(),
            note: note
        )
        viewController.presenter = presenter

        return viewController
    }
}
