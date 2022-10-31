import UIKit

class AppCoordinator {

    // MARK: - Injected properties
    private let window: UIWindow
    private let coordinatorBuilder: CoordinatorBuilder

    // MARK: - Private properties
    private let navigationController = UINavigationController()

    init(
        window: UIWindow,
        coordinatorBuilder: CoordinatorBuilder
    ) {
        self.window = window
        self.coordinatorBuilder = coordinatorBuilder
    }
}

extension AppCoordinator: Coordinator {
    func start(animated: Bool) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        if AppData.onboardingPassed {
            coordinatorBuilder.buildNotesListCoordinator(rootNavigationContoller: navigationController)
                .start(animated: animated)
        } else {
            coordinatorBuilder.buildOnboardingCoordinator(rootNavigationContoller: navigationController)
                .start(animated: animated)
        }
    }
}
