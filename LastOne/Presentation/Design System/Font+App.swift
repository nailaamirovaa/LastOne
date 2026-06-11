

import SwiftUI

extension Font {

    static let display = Font.custom("Newsreader-Medium",size: 40)
    
    static let heading1 = Font.custom("Newsreader-Medium",size: 32)

    static let heading2 = Font.custom("Newsreader-Medium",size: 26)

    static let heading3 = Font.system(size: 21,weight: .semibold)

    static let headline = Font.system(size: 17,weight: .semibold)

    static let bodyText = Font.system(size: 17,weight: .regular)

    static let callout = Font.system(size: 16,weight: .regular)

    static let subhead = Font.system(size: 15,weight: .regular)

    static let footnote = Font.system(size: 13,weight: .regular)

    static let caption = Font.system(size: 12,weight: .regular)

    static let label = Font.system(size: 11,weight: .semibold)
}
