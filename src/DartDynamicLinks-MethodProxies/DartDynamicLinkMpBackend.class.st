Class {
	#name : 'DartDynamicLinkMpBackend',
	#superclass : 'DartDynamicLinkBackend',
	#instVars : [
		'handler',
		'proxy'
	],
	#category : 'DartDynamicLinks-MethodProxies',
	#package : 'DartDynamicLinks-MethodProxies'
}

{ #category : 'accessing' }
DartDynamicLinkMpBackend >> handler [

	^ handler
]

{ #category : 'accessing' }
DartDynamicLinkMpBackend >> proxy [

	^ proxy
]

{ #category : 'instrumentation' }
DartDynamicLinkMpBackend >> startInstrumentation [

	| tmp2 |
	tmp2 := DartDynamicLinkMpHandler new.
	tmp2 link: self link.
	handler := tmp2 yourself.
	proxy := MpMethodProxy
		         onMethod: self link linkedBehavior method
		         handler: handler.
	self proxy
		install;
		enableInstrumentation
]

{ #category : 'instrumentation' }
DartDynamicLinkMpBackend >> stopInstrumentation [

	self proxy ifNil: [ ^ self ].
	self proxy uninstall
]
