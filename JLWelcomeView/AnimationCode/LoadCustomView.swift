//
//  LoadCustomView.swift
//
//  Code generated using QuartzCode 1.66.0 on 2019/3/26.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class LoadCustomView: UIView, CAAnimationDelegate {
	
	var layers = [String: CALayer]()
	var completionBlocks = [CAAnimation: (Bool) -> Void]()
	var updateLayerValueForCompletedAnimation : Bool = false
	
	var color1 : UIColor!
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	
	
	func setupProperties(){
		self.color1 = UIColor(red:0.274, green: 0.349, blue:0.937, alpha:1)
	}
	
	func setupLayers(){

        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.652932363)
        self.layer.cornerRadius = 15
		
		let oval = CAShapeLayer()
		oval.frame = CGRect(x: 12, y: 42, width: 16, height: 16)
		oval.path = ovalPath().cgPath
		self.layer.addSublayer(oval)
		layers["oval"] = oval
		
		let oval2 = CAShapeLayer()
		oval2.frame = CGRect(x: 72, y: 42, width: 16, height: 16)
		oval2.path = oval2Path().cgPath
		self.layer.addSublayer(oval2)
		layers["oval2"] = oval2
		
		let oval3 = CAShapeLayer()
		oval3.frame = CGRect(x: 42, y: 42, width: 16, height: 16)
		oval3.path = oval3Path().cgPath
		self.layer.addSublayer(oval3)
		layers["oval3"] = oval3
		
		resetLayerProperties(forLayerIdentifiers: nil)
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("oval"){
			let oval = layers["oval"] as! CAShapeLayer
			oval.fillColor   = self.color1.cgColor
			oval.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
			oval.lineWidth   = 0
		}
		if layerIds == nil || layerIds.contains("oval2"){
			let oval2 = layers["oval2"] as! CAShapeLayer
			oval2.fillColor   = self.color1.cgColor
			oval2.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
			oval2.lineWidth   = 0
		}
		if layerIds == nil || layerIds.contains("oval3"){
			let oval3 = layers["oval3"] as! CAShapeLayer
			oval3.fillColor   = self.color1.cgColor
			oval3.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
			oval3.lineWidth   = 0
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addUntitled1Animation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 1.536, endTime: CFTimeInterval = 0, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		let endTime = endTime * totalDuration
		
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = endTime
			completionAnim.delegate = self
			completionAnim.setValue("Untitled1", forKey:"animId")
			completionAnim.setValue(true, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"Untitled1")
			if let anim = layer.animation(forKey: "Untitled1"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : CAMediaTimingFillMode = reverseAnimation ? .both : .forwards
		
		////Oval animation
		let ovalPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		ovalPositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 20, y: 50)), NSValue(cgPoint: CGPoint(x: 20, y: 40)), NSValue(cgPoint: CGPoint(x: 20, y: 50))]
		ovalPositionAnim.keyTimes       = [0, 0.5, 1]
		ovalPositionAnim.duration       = 0.325 * totalDuration
		ovalPositionAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
		
		var ovalUntitled1Anim : CAAnimationGroup = QCMethod.group(animations: [ovalPositionAnim], fillMode:fillMode)
		if (reverseAnimation){ ovalUntitled1Anim = QCMethod.reverseAnimation(anim: ovalUntitled1Anim, totalDuration:totalDuration) as! CAAnimationGroup}
		layers["oval"]?.add(ovalUntitled1Anim, forKey:"ovalUntitled1Anim")
		
		////Oval2 animation
		let oval2PositionAnim            = CAKeyframeAnimation(keyPath:"position")
		oval2PositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 80, y: 50)), NSValue(cgPoint: CGPoint(x: 80, y: 40)), NSValue(cgPoint: CGPoint(x: 80, y: 50))]
		oval2PositionAnim.keyTimes       = [0, 0.5, 1]
		oval2PositionAnim.duration       = 0.325 * totalDuration
		oval2PositionAnim.beginTime      = 0.675 * totalDuration
		oval2PositionAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
		
		var oval2Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval2PositionAnim], fillMode:fillMode)
		if (reverseAnimation){ oval2Untitled1Anim = QCMethod.reverseAnimation(anim: oval2Untitled1Anim, totalDuration:totalDuration) as! CAAnimationGroup}
		layers["oval2"]?.add(oval2Untitled1Anim, forKey:"oval2Untitled1Anim")
		
		////Oval3 animation
		let oval3PositionAnim            = CAKeyframeAnimation(keyPath:"position")
		oval3PositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 50, y: 50)), NSValue(cgPoint: CGPoint(x: 50, y: 40)), NSValue(cgPoint: CGPoint(x: 50, y: 50))]
		oval3PositionAnim.keyTimes       = [0, 0.5, 1]
		oval3PositionAnim.duration       = 0.325 * totalDuration
		oval3PositionAnim.beginTime      = 0.349 * totalDuration
		oval3PositionAnim.timingFunction = CAMediaTimingFunction(name:.easeInEaseOut)
		
		var oval3Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [oval3PositionAnim], fillMode:fillMode)
		if (reverseAnimation){ oval3Untitled1Anim = QCMethod.reverseAnimation(anim: oval3Untitled1Anim, totalDuration:totalDuration) as! CAAnimationGroup}
		layers["oval3"]?.add(oval3Untitled1Anim, forKey:"oval3Untitled1Anim")
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "Untitled1"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["oval"]!.animation(forKey: "ovalUntitled1Anim"), theLayer:layers["oval"]!)
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["oval2"]!.animation(forKey: "oval2Untitled1Anim"), theLayer:layers["oval2"]!)
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["oval3"]!.animation(forKey: "oval3Untitled1Anim"), theLayer:layers["oval3"]!)
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "Untitled1"{
			layers["oval"]?.removeAnimation(forKey: "ovalUntitled1Anim")
			layers["oval2"]?.removeAnimation(forKey: "oval2Untitled1Anim")
			layers["oval3"]?.removeAnimation(forKey: "oval3Untitled1Anim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			layer.removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func ovalPath() -> UIBezierPath{
		let ovalPath = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 16, height: 16))
		return ovalPath
	}
	
	func oval2Path() -> UIBezierPath{
		let oval2Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 16, height: 16))
		return oval2Path
	}
	
	func oval3Path() -> UIBezierPath{
		let oval3Path = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: 16, height: 16))
		return oval3Path
	}
	
	
}
