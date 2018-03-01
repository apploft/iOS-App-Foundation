//
// UITableView
//

extension UITableView {
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let point = view.convert(CGPoint.zero, to: self)
        return indexPathForRow(at: point)
    }
}
