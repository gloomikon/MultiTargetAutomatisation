import UIKit

protocol NotesListViewProtocol: AnyObject {
    associatedtype DataSource
    associatedtype Snapshot

    func displayNotes(_ notes: [Note])
}

protocol NotesListViewControllerTemplate {
    associatedtype DataSource
    associatedtype Snapshot

    var dataSource: DataSource { get }

    func makeDataSource() -> DataSource
    func applySnapshot(notes: [Note], animatingDifferences: Bool)
}

extension NotesListViewProtocol where Self: NotesListViewControllerTemplate {
    func displayNotes(_ notes: [Note]) {
        applySnapshot(notes: notes, animatingDifferences: true)
    }
}

class BaseNotesListViewController: UIViewController {
    enum Section {
        case main
    }

    var presenter: NotesListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        presenter.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }

    @objc
    private func addButtonTapped() {
        presenter.addNoteButtonTapped()
    }
}
