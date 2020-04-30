import Foundation
import UIKit

class Profile {
    
    var username: String?
    var avatarURL: String?
   
    init(username: String, avatarURL: String) {
        self.username = username
        self.avatarURL = avatarURL
    }
}
