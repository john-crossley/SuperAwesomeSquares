//
//  Copyright © 2017 John Crossley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var numberOfRows: Int!
    private var numberOfColumns: Int!

    private var grid = [[Cell]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfRows = Int(view.frame.width) / Cell.size
        numberOfColumns = Int(view.frame.height) / Cell.size


        for column in 0...numberOfColumns {
            var columns = [Cell]()

            for row in 0...numberOfRows {

                let cell = Cell(row: row, column: column, color: .color)
                view.addSubview(cell)
                columns.append(cell)
            }

            grid.append(columns)
        }

        view.addGestureRecognizer(
            UIPanGestureRecognizer(target: self,
                                   action: #selector(handlePan(gesture:))))
    }

    private var selectedCell: UIView?

    func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)

        let width = view.frame.width / CGFloat(numberOfRows)
        let verticalIndex = Int(location.x / width)
        let horizontalIndex = Int(location.y / width)

        let cellView = grid[horizontalIndex][verticalIndex]

        if selectedCell != cellView {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {

                            self.selectedCell?.layer.transform = CATransform3DIdentity
                            
            }, completion: nil)
        }

        selectedCell = cellView

        view.bringSubview(toFront: cellView)

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {

                        cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)

        }, completion: nil)

        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5,
                           delay: 0.25,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseOut, animations: {
                cellView.layer.transform = CATransform3DIdentity
            }, completion: { (_) in

            })
        }
    }

    
}

