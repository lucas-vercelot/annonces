//
//  UIView+ConstraintLayout.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import UIKit

extension UIView {

    @discardableResult
    public func addAllZeroSpacingConstraints() -> [NSLayoutConstraint] {
        return addSpacingConstraints(top: 0, left: 0, bottom: 0, right: 0)
    }

    @discardableResult
    public func addSpacingConstraints(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> [NSLayoutConstraint] {
        var originConstraints = addOriginConstraints(top: top, left: left)
        let bottomConstraint = addBottomConstraint(bottom: bottom)
        let rightConstraint = addTrailingConstraint(trailing: right)
        
        if let bottomConstraint = bottomConstraint {
            originConstraints.append(bottomConstraint)
        }
        if let rightConstraint = rightConstraint {
            originConstraints.append(rightConstraint)
        }
        return originConstraints
    }
    
    @discardableResult
    public func addSpacingConstraints(margin: CGFloat) -> [NSLayoutConstraint] {
       return addSpacingConstraints(top: margin, left: margin, bottom: margin, right: margin)
    }

    @discardableResult
    public func addOriginConstraints(top: CGFloat, left: CGFloat) -> [NSLayoutConstraint] {
        guard superview != nil else { return [] }
        
        var constraints = [NSLayoutConstraint]()
        if let topConstraint = addTopConstraint(top: top) {
            constraints.append(topConstraint)
        }
        if let leftConstraint = addLeadingConstraint(leading: left) {
            constraints.append(leftConstraint)
        }
        return constraints
    }

    @discardableResult
    public func addTopConstraint(top: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: self,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: superview,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: top)
        superview.addConstraint(topConstraint)
        return topConstraint
    }
    
    @discardableResult
    public func addBottomConstraint(bottom: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConstraint = NSLayoutConstraint(item: superview,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: bottom)
        superview.addConstraint(bottomConstraint)
        
        return bottomConstraint
    }
    
    @discardableResult
    public func addLeadingConstraint(leading: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let leftConstraint = NSLayoutConstraint(item: self,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: superview,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: leading)
        superview.addConstraint(leftConstraint)
        
        return leftConstraint
    }
    
    @discardableResult
    public func addTrailingConstraint(trailing: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let rightConstraint = NSLayoutConstraint(item: superview,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .trailing,
                                                 multiplier: 1.0,
                                                 constant: trailing)
        superview.addConstraint(rightConstraint)
        
        return rightConstraint
    }
    
    @discardableResult
    public func addWidthConstraint(width: CGFloat,
                                   relation: NSLayoutConstraint.Relation,
                                   toItem: Any?,
                                   attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .width,
                                                 relatedBy: relation,
                                                 toItem: toItem,
                                                 attribute: attribute,
                                                 multiplier: 1.0,
                                                 constant: width)
        superview.addConstraint(widthConstraint)
        
        return widthConstraint
    }
    
    @discardableResult
    public func addWidthConstraint(constant: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1.0,
                                            constant: constant)
        superview.addConstraint(constraint)
        
        return constraint
    }
    @discardableResult
    public func addHeightConstraint(height: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height)
        superview.addConstraint(heightConstraint)
        
        return heightConstraint
    }
    
    @discardableResult
    public func addWidthConstraint(width: CGFloat) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: width)
        superview.addConstraint(widthConstraint)
        
        return widthConstraint
    }
    
    @discardableResult
    public func addCenterVerticalConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let centerConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .centerY,
                                                  relatedBy: .equal,
                                                  toItem: superview,
                                                  attribute: .centerY,
                                                  multiplier: 1.0,
                                                  constant: 0)
        superview.addConstraint(centerConstraint)
        
        return centerConstraint
    }
    
    @discardableResult
    public func addCenterHorizontalConstraint() -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        translatesAutoresizingMaskIntoConstraints = false
        
        let centerConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .centerX,
                                                  relatedBy: .equal,
                                                  toItem: superview,
                                                  attribute: .centerX,
                                                  multiplier: 1.0,
                                                  constant: 0)
        superview.addConstraint(centerConstraint)
        
        return centerConstraint
    }

    @discardableResult
    public func addAspectRatioConstraint(width: CGFloat, height: CGFloat) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false

        let aspectRatioConstraint = NSLayoutConstraint(item: self,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .width,
                                                       multiplier: height / width,
                                                       constant: 0)
        addConstraint(aspectRatioConstraint)
        
        return aspectRatioConstraint
    }
    
    public func center(in view: UIView) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
