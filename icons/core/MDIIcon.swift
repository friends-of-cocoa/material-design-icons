// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
	import AppKit
#elseif os(iOS) || os(tvOS) || os(watchOS)
	import UIKit
#endif

@available(macCatalyst 13.0, *)
public struct MDIIcon {
	public fileprivate(set) var name: String
	
	#if os(macOS)
		public typealias Image = NSImage
	#elseif os(iOS) || os(tvOS) || os(watchOS)
		public typealias Image = UIImage
	#endif
	
	public var image: Image {
		let bundle = BundleToken.bundle
		#if os(iOS) || os(tvOS)
			let image = Image(named: name, in: bundle, compatibleWith: nil)
		#elseif os(macOS)
			let name = NSImage.Name(self.name)
			let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
		#elseif os(watchOS)
			let image = Image(named: name)
		#endif
		guard let result = image else {
			fatalError("Unable to load image asset named \(name).")
		}
		return result
	}
}

// swiftlint:disable convenience_type
private final class BundleToken {
	static let bundle: Bundle = {
		Bundle(for: BundleToken.self)
	}()
}
// swiftlint:enable convenience_type
