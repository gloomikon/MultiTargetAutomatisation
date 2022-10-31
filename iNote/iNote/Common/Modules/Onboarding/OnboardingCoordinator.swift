import UIKit

class OnboardingCoordinator {

    // MARK: - Injected properties
    private unowned let rootNavigationContoller: UINavigationController
    private let onboardingPageCountProvider: OnboardingPageCountProvider
    private let factory: AbstractFactory
    private let coordinatorBuilder: CoordinatorBuilder

    // MARK: - Private properties
    private var page = 1

    init(
        rootNavigationContoller: UINavigationController,
        onboardingPageCountProvider: OnboardingPageCountProvider,
        factory: AbstractFactory,
        coordinatorBuilder: CoordinatorBuilder
    ) {
        self.rootNavigationContoller = rootNavigationContoller
        self.onboardingPageCountProvider = onboardingPageCountProvider
        self.factory = factory
        self.coordinatorBuilder = coordinatorBuilder
    }
}

extension OnboardingCoordinator: Coordinator {
    func start(animated: Bool) {
        let viewController = OnboardingViewController()
        let presenter = OnboardingPresenter(
            view: viewController,
            coordinator: self,
            page: page,
            onboardingInfoProvider: factory.makeOnboardingInfoProvider()
        )

        viewController.presenter = presenter

        rootNavigationContoller.setViewControllers([viewController], animated: animated)
    }
}

extension OnboardingCoordinator {
    func goToNextScreen() {
        page += 1

        if page > onboardingPageCountProvider.getPagesCount() {
            coordinatorBuilder.buildNotesListCoordinator(
                rootNavigationContoller: rootNavigationContoller
            )
            .start(animated: true)
            AppData.onboardingPassed = true
        } else {
            start(animated: true)
        }
    }
}
