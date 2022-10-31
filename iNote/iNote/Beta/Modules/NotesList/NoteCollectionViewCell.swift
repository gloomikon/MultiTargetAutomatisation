import UIKit

class NoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black950
            titleLabel.font = .titleSemiBold
        }
    }

    @IBOutlet private var modifiedDateLabel: UILabel! {
        didSet {
            modifiedDateLabel.textColor = .black800
            modifiedDateLabel.font = .captionLLight
        }
    }

    @IBOutlet private var noteTextLabel: UILabel! {
        didSet {
            noteTextLabel.textColor = .black900
            noteTextLabel.font = .bodyRegular
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    private func setup() {
        backgroundColor = .primary300
        layer.cornerRadius = 16
    }

    func configure(with note: Note) {
        titleLabel.text = note.title
        noteTextLabel.text = note.text
        modifiedDateLabel.text = "notes_list_modified_text".localized(arguments: note.creationDate.toString(with: "EEEEEE, HH:mm"))
    }

}
