//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

extension View {
    @inlinable
    public func then(_ body: (inout Self) -> Void) -> Self {
        var result = self
        
        body(&result)
        
        return result
    }
    
    /// Returns a type-erased version of `self`.
    @inlinable
    public func eraseToAnyView() -> AnyView {
        return .init(self)
    }
}

// MARK: View.background

extension View {
    #if swift(>=5.3)
    @_disfavoredOverload
    @inlinable
    public func background(_ color: Color) -> some View {
        background(PassthroughView(content: { color }))
    }
    #endif
    
    @inlinable
    @available(*, deprecated, message: "Please use View.backgroundFill(_:) instead.")
    public func backgroundColor(_ color: Color) -> some View {
        background(color.edgesIgnoringSafeArea(.all))
    }
    
    @inlinable
    public func backgroundFill(_ color: Color) -> some View {
        background(color.edgesIgnoringSafeArea(.all))
    }
    
    @inlinable
    public func backgroundFill<BackgroundFill: View>(
        _ fill: BackgroundFill,
        alignment: Alignment = .center
    ) -> some View {
        background(fill, alignment: alignment)
    }
}

// MARK: View.hidden

extension View {
    @inlinable
    public func hidden(_ isHidden: Bool) -> some View {
        Group {
            if isHidden {
                hidden()
            } else {
                self
            }
        }
    }
}

// MARK: View.offset

extension View {
    @inlinable
    public func inset(_ point: CGPoint) -> some View {
        offset(x: -point.x, y: -point.y)
    }
    
    @inlinable
    public func inset(_ length: CGFloat) -> some View {
        offset(x: -length, y: -length)
    }
    
    @inlinable
    public func offset(_ point: CGPoint) -> some View {
        offset(x: point.x, y: point.y)
    }
    
    @inlinable
    public func offset(_ length: CGFloat) -> some View {
        offset(x: length, y: length)
    }
}

// MARK: View.padding

extension View {
    #if swift(>=5.3)
    /// A view that pads this view inside the specified edge insets with a system-calculated amount of padding and a color.
    @_disfavoredOverload
    @inlinable
    public func padding(_ color: Color) -> some View {
        padding().background(color)
    }
    #else
    /// A view that pads this view inside the specified edge insets with a system-calculated amount of padding and a color.
    @inlinable
    public func padding(_ color: Color) -> some View {
        padding().background(color)
    }
    #endif
}
