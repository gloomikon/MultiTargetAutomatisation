import UIKit

class NotePreviewCoordinator: BaseNotePreviewCoordinator {
    private weak var presentedViewController: UIViewController?
}

extension NotePreviewCoordinator: NotePreviewCoordinatorProtocol {
    func close() {
        presentedViewController?.presentingViewController?.dismiss(animated: true)
    }
}

extension NotePreviewCoordinator: NotePreviewCoordinatorTemplate {
    func navigateToModule(with viewController: UIViewController, animated: Bool) {
        rootNavigationController.topViewController?.present(viewController, animated: animated)
        presentedViewController = viewController
    }
}

extension NotePreviewCoordinator: Coordinator { }
