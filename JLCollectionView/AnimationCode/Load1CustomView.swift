//
//  Load1CustomView.swift
//
//  Code generated using QuartzCode 1.66.0 on 2019/3/28.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class Load1CustomView: UIView, CAAnimationDelegate {
	
	var updateLayerValueForCompletedAnimation : Bool = false
	var completionBlocks = [CAAnimation: (Bool) -> Void]()
	var layers = [String: CALayer]()
	
	var color1 : UIColor!
	var color2 : UIColor!
	var color3 : UIColor!
	var color5 : UIColor!
	var color4 : UIColor!
	
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
		self.color1 = UIColor(red:1.00, green: 0.63, blue:0.41, alpha:1.0)
		self.color2 = UIColor(red:0.937, green: 0.64, blue:0.857, alpha:1)
		self.color3 = UIColor.white
		self.color5 = UIColor(red:0.50, green: 0.71, blue:1.00, alpha:1.0)
		self.color4 = UIColor(red:1.00, green: 0.97, blue:0.29, alpha:1.0)
	}
	
	func setupLayers(){
		self.backgroundColor = UIColor(red:1.00, green: 1.00, blue:1.00, alpha:1.0)
		
		let round = CAShapeLayer()
		round.frame = CGRect(x: 25, y: 25, width: 50, height: 50)
		round.path = roundPath().cgPath
		self.layer.addSublayer(round)
		layers["round"] = round
		
		resetLayerProperties(forLayerIdentifiers: nil)
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("round"){
			let round = layers["round"] as! CAShapeLayer
			round.lineCap     = .round
			round.lineJoin    = .round
			round.fillColor   = UIColor.clear.cgColor
			round.strokeColor = UIColor.clear.cgColor
			round.lineWidth   = 4

		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addAni1Animation(totalDuration: CFTimeInterval = 1.56, endTime: CFTimeInterval = 1, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		let endTime = endTime * totalDuration
		
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = endTime
			completionAnim.delegate = self
			completionAnim.setValue("ani1", forKey:"animId")
			completionAnim.setValue(true, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"ani1")
			if let anim = layer.animation(forKey: "ani1"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : CAMediaTimingFillMode = .forwards
		
		////Round animation
		let roundStrokeEndAnim      = CAKeyframeAnimation(keyPath:"strokeEnd")
		roundStrokeEndAnim.values   = [0, 1]
		roundStrokeEndAnim.keyTimes = [0, 1]
		roundStrokeEndAnim.duration = 1 * totalDuration
		
		let roundStrokeColorAnim      = CAKeyframeAnimation(keyPath:"strokeColor")
		roundStrokeColorAnim.values   = [self.color3.cgColor, 
			 UIColor(red:1.00, green: 0.63, blue:0.41, alpha:1.0).cgColor, 
			 self.color4.cgColor, 
			 UIColor(red:0.50, green: 0.71, blue:1.00, alpha:1.0).cgColor, 
			 self.color3.cgColor]
		roundStrokeColorAnim.keyTimes = [0, 0.153, 0.487, 0.869, 1]
		roundStrokeColorAnim.duration = totalDuration
		
		let roundStrokeStartAnim       = CAKeyframeAnimation(keyPath:"strokeStart")
		roundStrokeStartAnim.values    = [0, 1.01]
		roundStrokeStartAnim.keyTimes  = [0, 1]
		roundStrokeStartAnim.duration  = 0.513 * totalDuration
		roundStrokeStartAnim.beginTime = 0.487 * totalDuration
		
		let roundAni1Anim : CAAnimationGroup = QCMethod.group(animations: [roundStrokeEndAnim, roundStrokeColorAnim, roundStrokeStartAnim], fillMode:fillMode)
		layers["round"]?.add(roundAni1Anim, forKey:"roundAni1Anim")
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
		if identifier == "ani1"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["round"]!.animation(forKey: "roundAni1Anim"), theLayer:layers["round"]!)
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "ani1"{
			layers["round"]?.removeAnimation(forKey: "roundAni1Anim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			layer.removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func roundPath() -> UIBezierPath{
		let roundPath = UIBezierPath()
		roundPath.move(to: CGPoint(x: 25, y: 0))
		roundPath.addCurve(to: CGPoint(x: 50, y: 25), controlPoint1:CGPoint(x: 38.807, y: 0), controlPoint2:CGPoint(x: 50, y: 11.193))
		roundPath.addCurve(to: CGPoint(x: 25, y: 50), controlPoint1:CGPoint(x: 50, y: 38.807), controlPoint2:CGPoint(x: 38.807, y: 50))
		roundPath.addCurve(to: CGPoint(x: 0, y: 25), controlPoint1:CGPoint(x: 11.193, y: 50), controlPoint2:CGPoint(x: 0, y: 38.807))
		roundPath.addCurve(to: CGPoint(x: 25, y: 0), controlPoint1:CGPoint(x: 0, y: 11.193), controlPoint2:CGPoint(x: 11.193, y: 0))
		
		return roundPath
	}
	
	
}
