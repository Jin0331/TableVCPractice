import UIKit

// 세로정렬
extension UITextView {
    func centerVertically() {
            let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
            let size = sizeThatFits(fittingSize)
            let topOffset = (bounds.size.height - size.height * zoomScale) / 2
            let positiveTopOffset = max(1, topOffset)
            contentOffset.y = -positiveTopOffset
    }
 }

//MARK: - Extension
extension UIViewController : ResuableProtocol {
    static var identifier : String {
        return String(describing: self)
    }
}

extension UITableViewCell : ResuableProtocol {
    static var identifier : String {
        return String(describing: self)
    }
}
