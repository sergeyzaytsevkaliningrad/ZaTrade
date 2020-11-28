import UIKit

extension UIView {
    func top(_ constant: CGFloat = 0.0) {
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: constant).isActive = true
    }

    func bottom(_ constant: CGFloat = 0.0) {
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: constant).isActive = true
    }

    func leading(_ constant: CGFloat = 0.0) {
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: constant).isActive = true
    }

    func trailing(_ constant: CGFloat = 0.0) {
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: constant).isActive = true
    }

    func horizontal(_ leading: CGFloat = 0.0, trailing: CGFloat = 0.0) {
        self.leading(leading)
        self.trailing(trailing)
    }

    func vertical(_ top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        self.top(top)
        self.bottom(bottom)
    }
    
    func centerX() {
        self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
    }

    func centerY() {
        self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
    }

    func pins(_ insets: UIEdgeInsets = .zero) {
        self.top(insets.top)
        self.leading(insets.left)
        self.trailing(insets.right)
        self.bottom(insets.bottom)
    }
}


extension UIView {
    
    //fills the view full
    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.topAnchor, leading:
                superview?.leadingAnchor, bottom:
                superview?.bottomAnchor,trailing:
                superview?.trailingAnchor, padding: padding, size: .zero)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    //to regulate the anchor size
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    //All of the anchors Layout in function
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing,constant: padding.right).isActive = true
        }

        //didnt do anthing with size

        //needs to be completed with some code lines from https://www.youtube.com/watch?v=bd2KSWLXo3A&feature=youtu.be
     
        
    }
}
