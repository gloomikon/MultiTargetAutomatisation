import UIKit

class NotePreviewCoordinator: BaseNotePreviewCoordinator { }

extension NotePreviewCoordinator: NotePreviewCoordinatorTemplate {
    func navigateToModule(with viewController: UIViewController, animated: Bool) {
        rootNavigationController.pushViewController(viewController, animated: animated)
    }
}

extension NotePreviewCoordinator: NotePreviewCoordinatorProtocol {
    func close() {
        rootNavigationController.popViewController(animated: true)
    }
}

extension NotePreviewCoordinator: Coordinator { }

