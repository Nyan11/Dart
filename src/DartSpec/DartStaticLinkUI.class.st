Class {
	#name : 'DartStaticLinkUI',
	#superclass : 'SpPresenter',
	#instVars : [
		'staticLinkList',
		'staticLinkCode',
		'staticLinkRepository'
	],
	#category : 'DartSpec',
	#package : 'DartSpec'
}

{ #category : 'layout' }
DartStaticLinkUI >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: staticLinkList;
		  add: staticLinkCode;
		  yourself
]

{ #category : 'layout' }
DartStaticLinkUI >> initializePresenters [

	staticLinkList := self newTable.
	staticLinkCode := self newCode
]

{ #category : 'accessing' }
DartStaticLinkUI >> staticLinkRepository [

	^ staticLinkRepository
]

{ #category : 'accessing' }
DartStaticLinkUI >> staticLinkRepository: anObject [

	staticLinkRepository := anObject.
	self updatePresenter
]

{ #category : 'accessing' }
DartStaticLinkUI >> updatePresenter [

	super updatePresenter.
	self staticLinkRepository ifNil: [ ^ self ].
	staticLinkList items: self staticLinkRepository staticLinks
]
