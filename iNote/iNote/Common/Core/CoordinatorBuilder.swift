import UIKit

class CoordinatorBuilder {

    private let factory: AbstractFactory

    init(factory: AbstractFactory) {
        self.factory = factory
    }

    func buildOnboardingCoordinator(
        rootNavigationContoller: UINavigationController
    ) -> OnboardingCoordinator {
        .init(
            rootNavigationContoller: rootNavigationContoller,
            onboardingPageCountProvider: factory.makeOnboardingPageCountProvider(),
            factory: factory,
            coordinatorBuilder: self
        )
    }

    func buildNotesListCoordinator(
        rootNavigationContoller: UINavigationController
    ) -> NotesCoordinator {
        .init(
            rootNavigationController: rootNavigationContoller,
            factory: factory
        )
    }
}
