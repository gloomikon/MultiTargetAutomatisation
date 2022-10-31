import UIKit

class NotesListViewController: BaseNotesListViewController, NotesListViewControllerTemplate {

    typealias Cell = NoteCollectionViewCell
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Note>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Note>
    lazy var dataSource: DataSource = makeDataSource()

    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.register(type: Cell.self)
            collectionView.delegate = self
        }
    }
}

// MARK: - DiffableDataSource
extension NotesListViewController {

    func makeDataSource() -> DataSource {
        .init(collectionView: collectionView) { collectionView, indexPath, note in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? NoteCollectionViewCell
            cell?.configure(with: note)
            return cell
        }
    }

    func applySnapshot(notes: [Note], animatingDifferences: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(notes)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - UICollectionViewDelegate
extension NotesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.bounds.width - 15) / 2
        return .init(width: width, height: 150)
    }
}

extension NotesListViewController: NotesListViewProtocol {
    
}
