Class {
	#name : 'DartDynamicLinkMpHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'link',
		'pendingResults'
	],
	#category : 'DartDynamicLinks-MethodProxies',
	#package : 'DartDynamicLinks-MethodProxies'
}

{ #category : 'evaluating' }
DartDynamicLinkMpHandler >> afterExecutionWithReceiver: receiver arguments: args returnValue: value [

	| result |
	result := self pendingResults at: receiver.
	result metadata at: #afterExecutionTime put: DateAndTime now.
	result metadata
		at: #afterExecutionAssertion
		put: (self link configuration afterAssertion
				 valueWithEnoughArguments: {
						 result metadata.
						 receiver.
						 args.
						 value }).
	self link configuration afterCodeExecution
		valueWithEnoughArguments: {
				result metadata.
				receiver.
				args.
				value }.
	self link configuration isTracingReceiver
		ifTrue: [ result object: receiver ]
		ifFalse: [ result object: value ].
	self link backend linkRepository addDynamicLinkExecutionResult: result.
	self pendingResults removeKey: receiver.
	^ value
]

{ #category : 'evaluating' }
DartDynamicLinkMpHandler >> beforeExecutionWithReceiver: receiver arguments: args [

	| result |
	result := DartDynamicLinkExecutionResult new
		          dynamicLink: self link;
		          yourself.
	self pendingResults at: receiver put: result.
	result metadata
		at: #beforeExecutionTime put: DateAndTime now;
		at: #beforeExecutionAssertion
		put: (self link configuration beforeAssertion
				 valueWithEnoughArguments: {
						 result metadata.
						 receiver.
						 args }).
	self link configuration beforeCodeExecution
		valueWithEnoughArguments: {
				result metadata.
				receiver.
				args }
]

{ #category : 'initialization' }
DartDynamicLinkMpHandler >> initialize [

	super initialize.
	pendingResults := IdentityDictionary new
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> link [

	^ link
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> link: anObject [

	link := anObject
]

{ #category : 'accessing' }
DartDynamicLinkMpHandler >> pendingResults [

	^ pendingResults
]
