//
//  Copyright © 2017 John Crossley. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let red = drand48()
        let green = drand48()
        let blue = drand48()
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }

    static var greyScale: UIColor {
        var gScale: CGFloat = 0
        var alpha: CGFloat = 0

        if random.getWhite(&gScale, alpha: &alpha) {
            return UIColor(white: gScale, alpha: alpha)
        }

        return .white
    }
}
