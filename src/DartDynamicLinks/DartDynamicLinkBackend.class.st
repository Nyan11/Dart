Class {
	#name : 'DartDynamicLinkBackend',
	#superclass : 'Object',
	#instVars : [
		'dynamicLink'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'accessing' }
DartDynamicLinkBackend >> dynamicLink [

	^ dynamicLink
]

{ #category : 'accessing' }
DartDynamicLinkBackend >> dynamicLink: anObject [

	dynamicLink := anObject
]

{ #category : 'actions' }
DartDynamicLinkBackend >> startInstrumentation [

	^ self shouldBeImplemented
]

{ #category : 'actions' }
DartDynamicLinkBackend >> stopInstrumentation [

	^ self shouldBeImplemented
]
