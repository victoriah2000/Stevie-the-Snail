//
// MosquitoAnimationView.swift
// Generated by Core Animator version 1.4 on 6/3/17.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class MosquitoAnimationPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class MosquitoAnimationView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 498, height: 500))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:498, height:500)
		__scaling__.center = CGPoint(x:249.0, y:250.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let mosquito__root = MosquitoAnimationPassthroughView()
		let mosquito__xScale = MosquitoAnimationPassthroughView()
		let mosquito__yScale = MosquitoAnimationPassthroughView()
		let mosquito = UIImageView()
		let imgAsset1 = UIImage(named:"Asset 1.png", in: bundle, compatibleWith: nil)
		if imgAsset1 == nil {
			print("** Warning: Could not create image from 'Asset 1.png'")
		}
		mosquito.image = imgAsset1
		mosquito.contentMode = .center
		mosquito.bounds = CGRect(x:0, y:0, width:50.0, height:36.0)
		mosquito__root.layer.position = CGPoint(x:269.000, y:80.000)
		mosquito__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		mosquito__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		mosquito__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(mosquito__root)
		mosquito__root.addSubview(mosquito__xScale)
		mosquito__xScale.addSubview(mosquito__yScale)
		mosquito__yScale.addSubview(mosquito)
		__scaling__.addSubview(mosquito__root)
		viewsByName["mosquito__root"] = mosquito__root
		viewsByName["mosquito__xScale"] = mosquito__xScale
		viewsByName["mosquito__yScale"] = mosquito__yScale
		viewsByName["mosquito"] = mosquito

		self.viewsByName = viewsByName
	}

	// - MARK: mosquito buzz

	func addMosquitoBuzzAnimation() {
		addMosquitoBuzzAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addMosquitoBuzzAnimation(completion: ((Bool) -> Void)?) {
		addMosquitoBuzzAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addMosquitoBuzzAnimation(removedOnCompletion: Bool) {
		addMosquitoBuzzAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addMosquitoBuzzAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addMosquitoBuzzAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addMosquitoBuzzAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 2.500
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "MosquitoBuzz")
			self.animationCompletions[layer.animation(forKey: "MosquitoBuzz")!] = complete
		}

		let mosquitoTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		mosquitoTranslationXAnimation.duration = 2.500
		mosquitoTranslationXAnimation.values = [-113.068, -113.068, 76.932, 6.932, -103.068, -103.068] as [Float]
		mosquitoTranslationXAnimation.keyTimes = [0.000, 0.000, 0.400, 0.600, 0.800, 1.000] as [NSNumber]
		mosquitoTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		mosquitoTranslationXAnimation.beginTime = beginTime
		mosquitoTranslationXAnimation.fillMode = fillMode
		mosquitoTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["mosquito__root"]?.layer.add(mosquitoTranslationXAnimation, forKey:"mosquito buzz_TranslationX")

		let mosquitoTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		mosquitoTranslationYAnimation.duration = 2.500
		mosquitoTranslationYAnimation.values = [216.932, 6.932, 216.932, 136.932, -23.068] as [Float]
		mosquitoTranslationYAnimation.keyTimes = [0.000, 0.400, 0.600, 0.800, 1.000] as [NSNumber]
		mosquitoTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
		mosquitoTranslationYAnimation.beginTime = beginTime
		mosquitoTranslationYAnimation.fillMode = fillMode
		mosquitoTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["mosquito__root"]?.layer.add(mosquitoTranslationYAnimation, forKey:"mosquito buzz_TranslationY")
	}

	func removeMosquitoBuzzAnimation() {
		self.layer.removeAnimation(forKey: "MosquitoBuzz")
		self.viewsByName["mosquito__root"]?.layer.removeAnimation(forKey: "mosquito buzz_TranslationX")
		self.viewsByName["mosquito__root"]?.layer.removeAnimation(forKey: "mosquito buzz_TranslationY")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "MosquitoBuzz")
	}
}