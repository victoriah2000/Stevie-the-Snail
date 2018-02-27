//
// BeeAnimationView.swift
// Generated by Core Animator version 1.4 on 5/31/17.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class BeeAnimationPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class BeeAnimationView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 1136, height: 768))
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
		__scaling__.bounds = CGRect(x:0, y:0, width:1136, height:768)
		__scaling__.center = CGPoint(x:568.0, y:384.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let asset10__root = BeeAnimationPassthroughView()
		let asset10__xScale = BeeAnimationPassthroughView()
		let asset10__yScale = BeeAnimationPassthroughView()
		let asset10 = UIImageView()
		let imgAsset10 = UIImage(named:"Asset 10.png", in: bundle, compatibleWith: nil)
		if imgAsset10 == nil {
			print("** Warning: Could not create image from 'Asset 10.png'")
		}
		asset10.image = imgAsset10
		asset10.contentMode = .center
		asset10.bounds = CGRect(x:0, y:0, width:44.0, height:53.0)
		asset10__root.layer.position = CGPoint(x:1186.000, y:172.031)
		asset10__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		asset10__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		asset10__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(asset10__root)
		asset10__root.addSubview(asset10__xScale)
		asset10__xScale.addSubview(asset10__yScale)
		asset10__yScale.addSubview(asset10)
		__scaling__.addSubview(asset10__root)
		viewsByName["Asset 10__root"] = asset10__root
		viewsByName["Asset 10__xScale"] = asset10__xScale
		viewsByName["Asset 10__yScale"] = asset10__yScale
		viewsByName["Asset 10"] = asset10

		self.viewsByName = viewsByName
	}

	// - MARK: fly

	func addFlyAnimation() {
		addFlyAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addFlyAnimation(completion: ((Bool) -> Void)?) {
		addFlyAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addFlyAnimation(removedOnCompletion: Bool) {
		addFlyAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addFlyAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addFlyAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addFlyAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let easeInOutTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 5.000
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Fly")
			self.animationCompletions[layer.animation(forKey: "Fly")!] = complete
		}

		let asset10TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		asset10TranslationXAnimation.duration = 5.000
		asset10TranslationXAnimation.values = [-3.004, -988.395, -1329.208] as [Float]
		asset10TranslationXAnimation.keyTimes = [0.000, 0.740, 1.000] as [NSNumber]
		asset10TranslationXAnimation.timingFunctions = [easeInOutTiming, linearTiming]
		asset10TranslationXAnimation.beginTime = beginTime
		asset10TranslationXAnimation.fillMode = fillMode
		asset10TranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Asset 10__root"]?.layer.add(asset10TranslationXAnimation, forKey:"fly_TranslationX")

		let asset10TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		asset10TranslationYAnimation.duration = 5.000
		asset10TranslationYAnimation.values = [-3.004, 16.501, 87.665, -96.143, -61.410, -5.564, 53.580, -27.815] as [Float]
		asset10TranslationYAnimation.keyTimes = [0.000, 0.175, 0.200, 0.450, 0.475, 0.700, 0.725, 1.000] as [NSNumber]
		asset10TranslationYAnimation.timingFunctions = [easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming, easeInOutTiming]
		asset10TranslationYAnimation.beginTime = beginTime
		asset10TranslationYAnimation.fillMode = fillMode
		asset10TranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Asset 10__root"]?.layer.add(asset10TranslationYAnimation, forKey:"fly_TranslationY")
	}

	func removeFlyAnimation() {
		self.layer.removeAnimation(forKey: "Fly")
		self.viewsByName["Asset 10__root"]?.layer.removeAnimation(forKey: "fly_TranslationX")
		self.viewsByName["Asset 10__root"]?.layer.removeAnimation(forKey: "fly_TranslationY")
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
		self.layer.removeAnimation(forKey: "Fly")
	}
}