//
//  LogoCustomView.swift
//
//  Code generated using QuartzCode 1.66.0 on 2019/3/30.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class LogoCustomView: UIView, CAAnimationDelegate {
	
	var layers = [String: CALayer]()
	var completionBlocks = [CAAnimation: (Bool) -> Void]()
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
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
		
	}
	
	func setupLayers(){
		self.backgroundColor = UIColor(red:255, green: 255, blue:255, alpha:0.0)
		
		let tumblr_t_152x270_ = CALayer()
		tumblr_t_152x270_.frame = CGRect(x: 50, y: 50, width: 0, height: 0)
		self.layer.addSublayer(tumblr_t_152x270_)
		layers["tumblr_t_152x270_"] = tumblr_t_152x270_
		
		resetLayerProperties(forLayerIdentifiers: nil)
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("tumblr_t_152x270_"){
            let tumblr_t_152x270_ = layers["tumblr_t_152x270_"] as! CALayer
			tumblr_t_152x270_.contents = UIImage(named:"tumblr_t_152x270_")?.cgImage
            
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addTumblrAnimation(totalDuration: CFTimeInterval = 0.818, completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
			completionAnim.delegate = self
			completionAnim.setValue("tumblr", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"tumblr")
			if let anim = layer.animation(forKey: "tumblr"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : CAMediaTimingFillMode = .forwards
		
		////Tumblr_t_152x270_ animation
		let tumblr_t_152x270_BoundsAnim      = CAKeyframeAnimation(keyPath:"bounds")
		tumblr_t_152x270_BoundsAnim.values   = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 0, height: 0)), NSValue(cgRect: CGRect(x: 0, y: 0, width: 55, height: 98)), NSValue(cgRect: CGRect(x: 0, y: 0, width: 50, height: 89))]
		tumblr_t_152x270_BoundsAnim.keyTimes = [0, 0.74, 1]
		tumblr_t_152x270_BoundsAnim.duration = totalDuration
		tumblr_t_152x270_BoundsAnim.timingFunction = CAMediaTimingFunction(name:.easeOut)
		
		let tumblr_t_152x270_TumblrAnim : CAAnimationGroup = QCMethod.group(animations: [tumblr_t_152x270_BoundsAnim], fillMode:fillMode)
		layers["tumblr_t_152x270_"]?.add(tumblr_t_152x270_TumblrAnim, forKey:"tumblr_t_152x270_TumblrAnim")
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
		if identifier == "tumblr"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: layers["tumblr_t_152x270_"]!.animation(forKey: "tumblr_t_152x270_TumblrAnim"), theLayer:layers["tumblr_t_152x270_"]!)
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "tumblr"{
			layers["tumblr_t_152x270_"]?.removeAnimation(forKey: "tumblr_t_152x270_TumblrAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			layer.removeAllAnimations()
		}
	}
	
}
