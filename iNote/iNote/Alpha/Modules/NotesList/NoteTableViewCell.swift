import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black950
            titleLabel.font = .titleSemiBold
        }
    }

    @IBOutlet private var addedDateLabel: UILabel! {
        didSet {
            addedDateLabel.textColor = .black800
            addedDateLabel.font = .captionLLight
        }
    }

    @IBOutlet private var lastModifyDateLabel: UILabel! {
        didSet {
            lastModifyDateLabel.textColor = .black800
            lastModifyDateLabel.font = .captionLLight
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
        backgroundColor = .clear
    }

    func configure(with note: Note) {
        titleLabel.text = note.title
        noteTextLabel.text = note.text
        addedDateLabel.text = "notes_list_added_text".localized(arguments: note.creationDate.toString(with: "YY, MMM d, HH:mm:ss"))
        lastModifyDateLabel.text = "notes_list_modified_text".localized(arguments: note.creationDate.toString(with: "YY, MMM d, HH:mm:ss"))
    }
}
