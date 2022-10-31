protocol AbstractFactory {
    func makeOnboardingPageCountProvider() -> OnboardingPageCountProvider
    func makeOnboardingInfoProvider() -> OnboardingInfoProvider
    func makeNotesProvider() -> NotesProvider
}

class ObjectFactory: AbstractFactory {
    func makeOnboardingPageCountProvider() -> OnboardingPageCountProvider {
        .init()
    }

    func makeOnboardingInfoProvider() -> OnboardingInfoProvider {
        .init()
    }

    func makeNotesProvider() -> NotesProvider {
        .init()
    }
}
