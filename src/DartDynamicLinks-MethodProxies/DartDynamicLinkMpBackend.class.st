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

	handler := DartDynamicLinkMpHandler new
		           dynamicLink: self dynamicLink;
		           yourself.
	proxy := MpMethodProxy
		         onMethod: self dynamicLink linkedBehavior method
		         handler: handler.
	self proxy install.
	self proxy enableInstrumentation
]

{ #category : 'instrumentation' }
DartDynamicLinkMpBackend >> stopInstrumentation [

	self proxy ifNil: [ ^ self ].
	self proxy uninstall
]
