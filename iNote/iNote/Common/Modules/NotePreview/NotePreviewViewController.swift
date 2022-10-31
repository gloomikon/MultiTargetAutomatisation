import UIKit

class NotePreviewViewController: UIViewController {

    @IBOutlet private var lastModifyDateLabel: UILabel! {
        didSet {
            lastModifyDateLabel.textColor = .black800
            lastModifyDateLabel.font = .captionLLight
            lastModifyDateLabel.text = ""
        }
    }

    @IBOutlet private var titleTextView: UITextView! {
        didSet {
            titleTextView.textColor = .black950
            titleTextView.font = .titleSemiBold
            titleTextView.text = "note_preview_title".localized
        }
    }

    @IBOutlet private var noteTextTextView: UITextView! {
        didSet {
            noteTextTextView.textColor = .black900
            noteTextTextView.font = .bodyRegular
            noteTextTextView.text = "note_preview_text".localized
        }
    }

    @IBOutlet var doneButton: UIButton! {
        didSet {
            doneButton.setTitle("note_preview_done".localized(), for: .normal)
            doneButton.titleLabel?.font = .headingsH3SemiBold
            doneButton.backgroundColor = .clear
            doneButton.layer.cornerRadius = 16
            doneButton.layer.borderWidth = 3
            doneButton.layer.borderColor = UIColor.primary500.cgColor
            doneButton.setTitleColor(.primary500, for: .normal)
        }
    }

    @IBOutlet private var deleteButton: UIButton! {
        didSet {

            deleteButton.setTitle("note_preview_delete".localized(), for: .normal)
            deleteButton.titleLabel?.font = .headingsH3SemiBold
            deleteButton.backgroundColor = .primary500
            deleteButton.setTitleColor(.constantWhite, for: .normal)
            deleteButton.layer.cornerRadius = 16
        }
    }

    private var note: Note?
    var presenter: NotePreviewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background

        presenter.viewDidLoad()
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        let title = titleTextView.text
        let text = noteTextTextView.text ?? ""

        presenter.updatedNote(title: title, text: text)
    }

    @IBAction func deleteButtonTapped(_ sender: Any) {
        presenter.delete()
    }
}

extension NotePreviewViewController {
    func displayNote(_ note: Note) {
        lastModifyDateLabel.text = "notes_list_modified_text".localized(arguments: note.lastModifyDate.toString(with: "EEEEEE, HH:mm"))
        titleTextView.text = note.title
        noteTextTextView.text = note.text
    }
}
