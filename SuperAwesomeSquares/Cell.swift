//
//  Copyright © 2017 John Crossley. All rights reserved.
//

import UIKit

enum CellColor {
    case color
    case grey
}

class Cell : UIView {
    static var size: Int {
        get {
            return 30
        }
    }

    init(row: Int, column: Int, color: CellColor) {
        super.init(frame: CGRect(x: row * Cell.size,
                                 y: column * Cell.size,
                                 width: Cell.size,
                                 height: Cell.size))

        setupCell(with: color)
    }

    private func setupCell(with color: CellColor) {
        if color == .color {
            backgroundColor = UIColor.random
        } else {
            backgroundColor = UIColor.greyScale
        }

        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
