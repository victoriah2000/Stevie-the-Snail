//
// StevieSnailTitleTreatmentView.swift
// Generated by Core Animator version 1.4 on 6/5/17.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class StevieSnailTitleTreatmentPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class StevieSnailTitleTreatmentView : UIView, CAAnimationDelegate {


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

		let titleCopy__root = StevieSnailTitleTreatmentPassthroughView()
		let titleCopy__xScale = StevieSnailTitleTreatmentPassthroughView()
		let titleCopy__yScale = StevieSnailTitleTreatmentPassthroughView()
		let titleCopy = UIImageView()
		let imgTitleCopy = UIImage(named:"title_copy.png", in: bundle, compatibleWith: nil)
		if imgTitleCopy == nil {
			print("** Warning: Could not create image from 'title_copy.png'")
		}
		titleCopy.image = imgTitleCopy
		titleCopy.contentMode = .center
		titleCopy.bounds = CGRect(x:0, y:0, width:451.0, height:294.0)
		titleCopy__root.layer.position = CGPoint(x:662.000, y:-118.972)
		titleCopy__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		titleCopy__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		titleCopy__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(titleCopy__root)
		titleCopy__root.addSubview(titleCopy__xScale)
		titleCopy__xScale.addSubview(titleCopy__yScale)
		titleCopy__yScale.addSubview(titleCopy)
		__scaling__.addSubview(titleCopy__root)
		viewsByName["title_copy__root"] = titleCopy__root
		viewsByName["title_copy__xScale"] = titleCopy__xScale
		viewsByName["title_copy__yScale"] = titleCopy__yScale
		viewsByName["title_copy"] = titleCopy

		self.viewsByName = viewsByName
	}

	// - MARK: title_animation

	func addTitleAnimation() {
		addTitleAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addTitleAnimation(completion: ((Bool) -> Void)?) {
		addTitleAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addTitleAnimation(removedOnCompletion: Bool) {
		addTitleAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addTitleAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addTitleAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addTitleAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 2.500
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "TitleAnimation")
			self.animationCompletions[layer.animation(forKey: "TitleAnimation")!] = complete
		}

		let titleCopyTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		titleCopyTranslationXAnimation.duration = 2.500
		titleCopyTranslationXAnimation.values = [0.000, 0.000] as [Float]
		titleCopyTranslationXAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		titleCopyTranslationXAnimation.timingFunctions = [linearTiming]
		titleCopyTranslationXAnimation.beginTime = beginTime
		titleCopyTranslationXAnimation.fillMode = fillMode
		titleCopyTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["title_copy__root"]?.layer.add(titleCopyTranslationXAnimation, forKey:"title_animation_TranslationX")

		let titleCopyTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		titleCopyTranslationYAnimation.duration = 2.500
		titleCopyTranslationYAnimation.values = [0.000, 290.000] as [Float]
		titleCopyTranslationYAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		titleCopyTranslationYAnimation.timingFunctions = [linearTiming]
		titleCopyTranslationYAnimation.beginTime = beginTime
		titleCopyTranslationYAnimation.fillMode = fillMode
		titleCopyTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["title_copy__root"]?.layer.add(titleCopyTranslationYAnimation, forKey:"title_animation_TranslationY")
	}

	func removeTitleAnimation() {
		self.layer.removeAnimation(forKey: "TitleAnimation")
		self.viewsByName["title_copy__root"]?.layer.removeAnimation(forKey: "title_animation_TranslationX")
		self.viewsByName["title_copy__root"]?.layer.removeAnimation(forKey: "title_animation_TranslationY")
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
		self.layer.removeAnimation(forKey: "TitleAnimation")
	}
}