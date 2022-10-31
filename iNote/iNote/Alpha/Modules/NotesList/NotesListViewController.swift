import UIKit

class NotesListViewController: BaseNotesListViewController, NotesListViewControllerTemplate {

    typealias Cell = NoteTableViewCell
    typealias DataSource = UITableViewDiffableDataSource<Section, Note>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Note>
    lazy var dataSource = makeDataSource()

    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.register(type: Cell.self)
            tableView.delegate = self
        }
    }
}

// MARK: - DiffableDataSource
extension NotesListViewController {
    func applySnapshot(notes: [Note], animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(notes)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    func makeDataSource() -> DataSource {
        .init(tableView: tableView) { tableView, indexPath, note in
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell
            cell?.configure(with: note)
            return cell
        }
    }
}

extension NotesListViewController: NotesListViewProtocol {

}

// MARK: - UITableViewDelegate
extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
