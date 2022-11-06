import Foundation

struct Note {
    let id: UUID

    let title: String?
    let text: String
    let creationDate: Date
    let lastModifyDate: Date

    init(
        id: UUID = .init(),
        title: String?,
        text: String,
        creationDate: Date,
        lastModifyDate: Date
    ) {
        self.id = id
        self.title = title
        self.text = text
        self.creationDate = creationDate
        self.lastModifyDate = lastModifyDate
    }
}

extension Note: Codable { }

extension Note: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
