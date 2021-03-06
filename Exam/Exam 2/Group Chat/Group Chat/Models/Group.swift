//
//  Group.swift
//  Group Chat
//
//  Created by Jingkun Liu on 5/5/22.
//

import Foundation
import Firebase

class Group {
    var memberEmails = [String]()
    var name: String
    var ownerEmail: String
    var documentId: String?
    
    init(name: String, ownerEmail: String, memberEmails: [String]) {
        self.name = name
        self.ownerEmail = ownerEmail

        self.memberEmails.append(self.ownerEmail)
        self.memberEmails.append(contentsOf: memberEmails)
    }
    
    init(snapshot: DocumentSnapshot) {
        self.documentId = snapshot.documentID
        self.memberEmails = snapshot.get(Constants.GROUPS_MEMBER_EMAILS_KEY) as! [String]
        self.name = snapshot.get(Constants.GROUPS_NAME_KEY) as! String
        self.ownerEmail = snapshot.get(Constants.GROUPS_OWNER_EMAIL_KEY) as! String
    }
}
