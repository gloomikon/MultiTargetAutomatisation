class OnboardingPresenter {

    // MARK: - Injected properties
    private unowned var view: OnboardingViewController
    private let coordinator: OnboardingCoordinator
    private let page: Int
    private let onboardingInfoProvider: OnboardingInfoProvider

    init(
        view: OnboardingViewController,
        coordinator: OnboardingCoordinator,
        page: Int,
        onboardingInfoProvider: OnboardingInfoProvider
    ) {
        self.view = view
        self.coordinator = coordinator
        self.page = page
        self.onboardingInfoProvider = onboardingInfoProvider
    }
}

extension OnboardingPresenter {
    func viewDidLoad() {
        let info = onboardingInfoProvider.getInfo(for: page)
        view.displayInfo(info)
    }

    func continueButtonTapped() {
        coordinator.goToNextScreen()
    }
}
