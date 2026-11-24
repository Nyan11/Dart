Class {
	#name : 'DartDynamicLinkBackend',
	#superclass : 'Object',
	#instVars : [
		'link',
		'linkRepository'
	],
	#category : 'DartDynamicLinks',
	#package : 'DartDynamicLinks'
}

{ #category : 'accessing' }
DartDynamicLinkBackend >> link [

	^ link
]

{ #category : 'accessing' }
DartDynamicLinkBackend >> link: arg1 [

	link := arg1
]

{ #category : 'accessing' }
DartDynamicLinkBackend >> linkRepository [

	^ linkRepository
]

{ #category : 'accessing' }
DartDynamicLinkBackend >> linkRepository: anObject [

	linkRepository := anObject
]

{ #category : 'actions' }
DartDynamicLinkBackend >> startInstrumentation [

	^ self shouldBeImplemented
]

{ #category : 'actions' }
DartDynamicLinkBackend >> stopInstrumentation [

	^ self shouldBeImplemented
]
